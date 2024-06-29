import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../constants/lectures.dart';
import 'Businessadministrationtest.dart';

class BusinessadministrationPage extends StatefulWidget {
  BusinessadministrationPage(
      {super.key, required this.videoId, required this.videoNum});

  final String videoId;
  final int videoNum;

  @override
  _BusinessadministrationPageState createState() =>
      _BusinessadministrationPageState();
}

class _BusinessadministrationPageState
    extends State<BusinessadministrationPage> {
  late YoutubePlayerController _youtubeController;
  int _currentTime = 0;

  @override
  void initState() {
    super.initState();

    _youtubeController = YoutubePlayerController(
      initialVideoId: widget.videoId, // تحديث معرف الفيديو الجديد هنا
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

    _youtubeController.addListener(() {
      if (_youtubeController.value.playerState == PlayerState.playing) {
        setState(() {
          _currentTime = _youtubeController.value.position.inSeconds;
        });
      }

      if (_youtubeController.value.playerState == PlayerState.ended) {
        getUploadDoneLecs();
        isText();
      }
    });
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  void _playNextVid() {
    if (widget.videoNum < BussinessVids.length - 1) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BusinessadministrationPage(
              videoNum: widget.videoNum + 1,
              videoId: BussinessVids[widget.videoNum + 1],
            ),
          ));
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> isText() async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = db
        .collection('users')
        .doc(userUid)
        .collection("courses")
        .doc("Business");

    final snapshot = await docRef.get();
    if (snapshot.exists) {
      List<dynamic> doneLecs = snapshot.get('DoneLecs');
      if (doneLecs.length == BussinessVids.length) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Businessadministrationtest()));
      } else {
        _playNextVid();
      }
    }
  }

  Future<void> getUploadDoneLecs() async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = db
        .collection('users')
        .doc(userUid)
        .collection("courses")
        .doc("Business");

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      List<dynamic> doneLecs = snapshot.get('DoneLecs');
      if (!doneLecs.contains(widget.videoNum)) {
        doneLecs.add(widget.videoNum);
        await docRef.update({
          'DoneLecs': doneLecs,
        });
      }
    } else {
      await docRef.set({
        'DoneLecs': [widget.videoNum],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.videoNum + 1} المحاضرة '),
      ),
      body: Column(
        children: [
          // القسم العلوي: عرض الفيديو
          Expanded(
            child: YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
          // القسم السفلي: شريط الوقت
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blueGrey,
            child: Text(
              'الوقت: $_currentTime ثانية',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

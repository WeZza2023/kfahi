import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%B5%D9%81%D8%AD%D8%A7%D8%AA%20%D8%A7%D9%84%D8%AA%D9%83%D9%86%D9%88%D9%84%D9%88%D8%AC%D9%8A%D8%A7/tot/totpagetest.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../constants/lectures.dart';

class TOTPage extends StatefulWidget {
  TOTPage({super.key, required this.videoId, required this.videoNum});

  final String videoId;
  final int videoNum;

  @override
  _TOTPageState createState() => _TOTPageState();
}

class _TOTPageState extends State<TOTPage> {
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

    _youtubeController.addListener(() async {
      if (_youtubeController.value.playerState == PlayerState.playing) {
        setState(() {
          _currentTime = _youtubeController.value.position.inSeconds;
        });
      }

      if (_youtubeController.value.playerState == PlayerState.ended) {
        _youtubeController.pause();
        await getUploadDoneLecs();
        _playNextVid();
      }
    });
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  Future<void> _playNextVid() async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        db.collection('users').doc(userUid).collection("courses").doc("TOT");

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      List<dynamic> doneLecs = snapshot.get('DoneLecs');
      if (widget.videoNum < TOTVids.length - 1 &&
          doneLecs.length != TOTVids.length) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TOTPage(
                videoNum: widget.videoNum + 1,
                videoId: TOTVids[widget.videoNum + 1],
              ),
            ));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TOTPagetest()));
      }
    }
  }

  Future<void> getUploadDoneLecs() async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        db.collection('users').doc(userUid).collection("courses").doc("TOT");

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

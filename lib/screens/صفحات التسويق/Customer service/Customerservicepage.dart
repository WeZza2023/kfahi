import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../constants/lectures.dart';
import 'Customerservicetest.dart';

class CustomerServicePage extends StatefulWidget {
  CustomerServicePage(
      {super.key, required this.videoId, required this.videoNum});

  final String videoId;
  final int videoNum;

  @override
  _CustomerServicePageState createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
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
    final docRef = db
        .collection('users')
        .doc(userUid)
        .collection("courses")
        .doc("Customer service");

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      List<dynamic> doneLecs = snapshot.get('DoneLecs');
      if (widget.videoNum < CustomerServicesVids.length - 1 &&
          doneLecs.length != CustomerServicesVids.length) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CustomerServicePage(
                    videoNum: widget.videoNum + 1,
                    videoId: CustomerServicesVids[widget.videoNum + 1],
                  ),
            ));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Customerservicetest()));
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
        .doc("Customer service");

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

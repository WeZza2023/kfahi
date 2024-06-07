import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/flutter/flutterpagetest32.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterPage32 extends StatefulWidget {
  const FlutterPage32({super.key});

  @override
  _FlutterPage32State createState() => _FlutterPage32State();
}

class _FlutterPage32State extends State<FlutterPage32> {
  late YoutubePlayerController _youtubeController;
  int _currentTime = 0;

  @override
  void initState() {
    super.initState();

    _youtubeController = YoutubePlayerController(
      initialVideoId: 'Dgv8qTvQMLE', // تحديث معرف الفيديو الجديد هنا
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
        // انتهى الفيديو، قم بالانتقال تلقائيًا إلى صفحة Webdevelopmentpageexam1
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const flutterpagetest32(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحاضرة 32'),
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

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: FlutterPage32(),
    ),
  );
}

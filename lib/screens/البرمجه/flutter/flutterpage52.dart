import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/flutter/flutterpagetest52.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterPage52 extends StatefulWidget {
  const FlutterPage52({super.key});

  @override
  _FlutterPage52State createState() => _FlutterPage52State();
}

class _FlutterPage52State extends State<FlutterPage52> {
  late YoutubePlayerController _youtubeController;
  int _currentTime = 0;

  @override
  void initState() {
    super.initState();

    _youtubeController = YoutubePlayerController(
      initialVideoId: '9zr4kBkZT2Y', // تحديث معرف الفيديو الجديد هنا
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
            builder: (context) => const flutterpagetest52(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحاضرة 52'),
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
      home: FlutterPage52(),
    ),
  );
}

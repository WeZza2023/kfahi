import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'WordPressDeveloperPageexam106.dart';

class WordPressDeveloperPage106 extends StatefulWidget {
  const WordPressDeveloperPage106({super.key});

  @override
  _WordPressDeveloperPage106State createState() =>
      _WordPressDeveloperPage106State();
}

class _WordPressDeveloperPage106State extends State<WordPressDeveloperPage106> {
  late YoutubePlayerController _youtubeController;
  int _currentTime = 0;

  @override
  void initState() {
    super.initState();

    _youtubeController = YoutubePlayerController(
      initialVideoId: 'oV6FpiFHZoQ',
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
        // انتهى الفيديو، قم بالانتقال تلقائيًا إلى صفحة WordPressDeveloperPageexam1
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WordPressDeveloperPageexam106(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحاضره 106'),
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
      home: WordPressDeveloperPage106(),
    ),
  );
}

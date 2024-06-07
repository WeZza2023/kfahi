import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%B5%D9%81%D8%AD%D8%A7%D8%AA%20%D8%A7%D9%84%D9%85%D8%AD%D8%A7%D8%B3%D8%A8%D9%87/Cost%20accounting/Costaccountingtest3.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Costaccountingpage3 extends StatefulWidget {
  const Costaccountingpage3({super.key});

  @override
  _Costaccountingpage3State createState() => _Costaccountingpage3State();
}

class _Costaccountingpage3State extends State<Costaccountingpage3> {
  late YoutubePlayerController _youtubeController;
  int _currentTime = 0;

  @override
  void initState() {
    super.initState();

    _youtubeController = YoutubePlayerController(
      initialVideoId: 'MANLw5SdjYc', // Update the video ID here
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
        // Video ended, automatically navigate to WordPressDeveloperPageexam1
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Costaccountingtest3(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحاضره الثالثه'),
      ),
      body: Column(
        children: [
          // Top section: Video display
          Expanded(
            child: YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
          // Bottom section: Time bar
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
      home: Costaccountingpage3(),
    ),
  );
}

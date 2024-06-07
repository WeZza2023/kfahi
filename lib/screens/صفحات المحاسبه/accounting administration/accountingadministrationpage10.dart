import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'accountingadministrationtest10.dart';

class accountingadministrationpage10 extends StatefulWidget {
  const accountingadministrationpage10({super.key});

  @override
  _accountingadministrationpage10State createState() =>
      _accountingadministrationpage10State();
}

class _accountingadministrationpage10State
    extends State<accountingadministrationpage10> {
  late YoutubePlayerController _youtubeController;
  int _currentTime = 0;

  @override
  void initState() {
    super.initState();

    _youtubeController = YoutubePlayerController(
      initialVideoId: 'zgkAIgglmFI', // Update the video ID here
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
            builder: (context) => const accountingadministrationtest10(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المحاضره العاشره'),
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
      home: accountingadministrationpage10(),
    ),
  );
}

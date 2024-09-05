import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/components/components.dart';
import 'package:kfahi/constants/colors.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/screens/video/video_cubit.dart';
import 'package:kfahi/screens/video/video_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  static String id = 'VideoScreen';

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    BlocProvider.of<VideoCubit>(context).initController(context: context);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<VideoCubit>(context);
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(
            context: context,
            title: 'المحاضره ${(cubit.videoNum + 1).toString()}',
            showBackButton: true,
            onTapBack: () {
              cubit.youtubeController.dispose();
              Navigator.pop(context);
            }),
        body: Column(
          children: [
            // القسم العلوي: عرض الفيديو
            Expanded(
              child: YoutubePlayer(
                controller: cubit.youtubeController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: kActiveColor,
              ),
            ),
            // القسم السفلي: شريط الوقت
          ],
        ),
      ),
    );
    ;
  }
}

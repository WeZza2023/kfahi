import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/test/test_cubit.dart';
import 'package:kfahi/screens/test/test_screen.dart';
import 'package:kfahi/screens/video/video_screen.dart';
import 'package:kfahi/screens/video/video_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());
  late YoutubePlayerController youtubeController;

  String videoId = '';
  int videoNum = 0;
  String course = '';
  List courseVids = [];
  List testQuestions = [];

  Future<void> getVideoDetails({
    required String videoId,
    required int videoNum,
    required String course,
    required List courseVids,
    required List testQuestions,
  }) async {
    this.videoId = videoId;
    this.videoNum = videoNum;
    this.course = course;
    this.courseVids = courseVids;
    this.testQuestions = testQuestions;

    emit(GetVideoDetailsSuccess());
  }

  Future<void> initController({required BuildContext context}) async {
    youtubeController = YoutubePlayerController(
      initialVideoId: videoId, // تحديث معرف الفيديو الجديد هنا
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

    youtubeController.addListener(() async {
      if (youtubeController.value.playerState == PlayerState.ended) {
        youtubeController.pause();
        await getUploadDoneLecs();
        _playNextVid(context: context);
      }
    });

    emit(InitControllerState());
  }

  Future<void> _playNextVid({required BuildContext context}) async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        db.collection('users').doc(userUid).collection("courses").doc(course);

    final snapshot = await docRef.get();

    if (snapshot.exists) {
      List<dynamic> doneLecs = snapshot.get('DoneLecs');
      if (videoNum < courseVids.length - 1 &&
          doneLecs.length != courseVids.length) {
        await getVideoDetails(
            course: course,
            videoId: courseVids[videoNum + 1],
            videoNum: videoNum + 1,
            courseVids: courseVids,
            testQuestions: testQuestions);

        // await initController(context: context);
        Navigator.pushReplacementNamed(context, VideoScreen.id);
        emit(NextVidState());
      } else {
        await BlocProvider.of<TestCubit>(context)
            .getRandomQuestions(count: 20, questions: testQuestions);
        await BlocProvider.of<TestCubit>(context).startNextQuestion();
        Navigator.pushReplacementNamed(context, TestScreen.id);
        emit(OpenTestState());
        // pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => Ethicalhackingpagetest()));
      }
    }
  }

  Future<void> getUploadDoneLecs() async {
    try {
      final db = FirebaseFirestore.instance;
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      final docRef =
          db.collection('users').doc(userUid).collection("courses").doc(course);

      final snapshot = await docRef.get();

      if (snapshot.exists) {
        List<dynamic> doneLecs = snapshot.get('DoneLecs');
        if (!doneLecs.contains(videoNum)) {
          doneLecs.add(videoNum);
          await docRef.update({
            'DoneLecs': doneLecs,
          });
          emit(GetUploadDoneLecsSuccessState());
        }
      } else {
        await docRef.set({
          'DoneLecs': [videoNum],
        });
      }
    } catch (e) {
      emit(GetUploadDoneLecsErrorState());
      print(e);
    }
  }
}

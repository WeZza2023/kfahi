import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/components/components.dart';
import 'package:kfahi/constants/colors.dart';
import 'package:kfahi/constants/custom_texts.dart';
import 'package:kfahi/extention/extetion.dart';
import 'package:kfahi/screens/video/video_screen.dart';
import 'package:kfahi/screens/video/video_state.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());
  late YoutubePlayerController youtubeController;

  String videoId = '';
  int videoNum = 0;
  String course = '';
  List courseVids = [];
  List testQuestions = [];
  bool isCourse = true;
  String collageName = '';

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
    final docRef = isCourse == true
        ? db.collection('users').doc(userUid).collection("courses").doc(course)
        : db
            .collection('users')
            .doc(userUid)
            .collection("collages")
            .doc(collageName)
            .collection('lectures')
            .doc(course);

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
        // if (testQuestions.isNotEmpty) {
        //   await BlocProvider.of<TestCubit>(context)
        //       .getRandomQuestions(count: 20, questions: testQuestions);
        //   await BlocProvider.of<TestCubit>(context)
        //       .startNextQuestion(context: context);
        //   Navigator.pushReplacementNamed(context, TestScreen.id);
        Navigator.pop(context);
        if (course != 'English L1' &&
            course != 'English L2' &&
            course != 'English L3' &&
            course != 'English L4' &&
            course != 'English L5' &&
            course != 'English L6' &&
            course != 'English L7' &&
            course != 'English L8' &&
            course != 'English L9' &&
            course != 'English L10' &&
            course != 'German L1' &&
            course != 'German L2' &&
            course != 'German L3' &&
            course != 'German L4') {
          showDialog(
            context: context,
            builder: (context) => AppPopupDialog(body: [
              const BodySmallText(
                'لقد قمت بانهاء هذا الكورس, يرجى الانتقال الى الدعم لاداء الاختبار',
                maxLines: 4,
                textAlign: TextAlign.center,
              ).bP8,
              CustomButton(
                  text: 'تيليجرام',
                  onPressed: () {
                    launchUrlString('https://bit.ly/3Y8c30Q');
                  },
                  color: kMainColor)
            ], title: 'احسنت'),
          );
        }
        emit(OpenTestState());
        // } else if (testQuestions.isEmpty) {
        //   Navigator.pop(context);
        // }
      }
    }
  }

  Future<void> getUploadDoneLecs() async {
    try {
      final db = FirebaseFirestore.instance;
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      final docRef = isCourse == true
          ? db
              .collection('users')
              .doc(userUid)
              .collection("courses")
              .doc(course)
          : db
              .collection('users')
              .doc(userUid)
              .collection("collages")
              .doc(collageName)
              .collection('lectures')
              .doc(course);

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

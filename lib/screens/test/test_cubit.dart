import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/test/test_state.dart';

import '../video/video_cubit.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  int remainingTimeInSeconds = 0;
  String resultMessage = '';
  Timer timer = Timer(Duration.zero, () {});
  List<Map<String, dynamic>> selectedQuestions = [];
  bool result = false;
  double percentage = 0;
  bool isCourse = true;

  Future<void> getRandomQuestions({
    required int count,
    required List questions,
  }) async {
    final random = Random();
    var shuffledQuestions = List<Map<String, dynamic>>.from(questions)
      ..shuffle(random);
    selectedQuestions = shuffledQuestions.take(count).toList();
    emit(GetRandomQuestionsState());
  }

  Future<void> startNextQuestion({required BuildContext context}) async {
    if (currentQuestionIndex < selectedQuestions.length) {
      remainingTimeInSeconds = 90;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remainingTimeInSeconds > 0) {
          remainingTimeInSeconds--;
          emit(DecreaseTimeState());
        } else {
          goToNextQuestion(context: context);
        }
      });
    } else {
      timer.cancel();
      showResult(context: context);
    }
  }

  void goToNextQuestion({required BuildContext context}) {
    timer.cancel();
    currentQuestionIndex++;
    emit(NextQuestionState());
    startNextQuestion(context: context);
  }

  Future<void> showResult({required BuildContext context}) async {
    final db = FirebaseFirestore.instance;
    final userUid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = isCourse == true
        ? db
            .collection('users')
            .doc(userUid)
            .collection("courses")
            .doc(BlocProvider.of<VideoCubit>(context).course)
        : db
            .collection('users')
            .doc(userUid)
            .collection("collages")
            .doc(BlocProvider.of<VideoCubit>(context).collageName)
            .collection('lectures')
            .doc(BlocProvider.of<VideoCubit>(context).course);
    final snapshot = await docRef.get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      if (data['result'] == null) {
        percentage = (correctAnswersCount / 20) * 100;
        await docRef.update({'result': '$percentage %'});
        if (percentage >= 80) {
          resultMessage = 'مبروك لقد اجتزت الاختبار!';
        } else {
          resultMessage =
              'للاسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق!';
        }
        result = true;
        emit(ShowResultSuccessState());
      } else {
        print(
            'عفوا لقد قمت بالاختبار من قبل..من فضلك تواصل مع الدعم للاختبار مجددا');
        result = true;
        emit(ShowResultErrorState());
      }
    }
  }

  void checkAnswer(int selectedOptionIndex, BuildContext context) {
    int correctOptionIndex =
        selectedQuestions[currentQuestionIndex]['correctOptionIndex'];

    if (selectedOptionIndex == correctOptionIndex) {
      correctAnswersCount++;
    }

    goToNextQuestion(context: context);
    emit(CheckAnswerState());
  }

  void clear() {
    currentQuestionIndex = 0;
    correctAnswersCount = 0;
    remainingTimeInSeconds = 0;
    resultMessage = '';
    timer = Timer(Duration.zero, () {});
    result = false;
    percentage = 0;
    selectedQuestions = [];
  }
}

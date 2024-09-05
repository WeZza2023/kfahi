import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/test/test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  int remainingTimeInSeconds = 0;
  String resultMessage = '';
  Timer timer = Timer(Duration.zero, () {});
  List<Map<String, dynamic>> selectedQuestions = [];
  bool result = false;

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

  Future<void> startNextQuestion() async {
    if (currentQuestionIndex < selectedQuestions.length) {
      remainingTimeInSeconds = 90;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remainingTimeInSeconds > 0) {
          remainingTimeInSeconds--;
          emit(DecreaseTimeState());
        } else {
          goToNextQuestion();
        }
      });
    } else {
      timer.cancel();
      showResult();
    }
  }

  void goToNextQuestion() {
    timer.cancel();
    currentQuestionIndex++;
    emit(NextQuestionState());
    startNextQuestion();
  }

  void showResult() {
    double percentage = (correctAnswersCount / 20) * 100;
    if (percentage >= 80) {
      resultMessage = 'مبروك لقد اجتزت الاختبار!';
    } else {
      resultMessage =
      'للاسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق!';
    }
    result = true;
    emit(ShowResultState());
  }

  void checkAnswer(int selectedOptionIndex) {
    int correctOptionIndex =
    selectedQuestions[currentQuestionIndex]['correctOptionIndex'];

    if (selectedOptionIndex == correctOptionIndex) {
      correctAnswersCount++;
    }

    goToNextQuestion();
    emit(CheckAnswerState());
  }

  void clear() {
    currentQuestionIndex = 0;
    correctAnswersCount = 0;
    remainingTimeInSeconds = 0;
    resultMessage = '';
    timer = Timer(Duration.zero, () {});
    selectedQuestions = [];
  }
}

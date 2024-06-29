import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../../../constants/questions.dart';

class Wordpressdeveloperpageexam extends StatefulWidget {
  const Wordpressdeveloperpageexam({super.key});

  @override
  _WordpressdeveloperpageexamState createState() =>
      _WordpressdeveloperpageexamState();
}

class _WordpressdeveloperpageexamState
    extends State<Wordpressdeveloperpageexam> {
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  int _remainingTimeInSeconds = 60; // مدة السؤال بالثواني

  late Timer _timer;
  late List<Map<String, dynamic>> _selectedQuestions;

  @override
  void initState() {
    super.initState();
    _selectedQuestions = _getRandomQuestions(20);
    _startNextQuestion();
  }

  List<Map<String, dynamic>> _getRandomQuestions(int count) {
    final random = Random();
    final shuffledQuestions = List<Map<String, dynamic>>.from(WordPrsQues)
      ..shuffle(random);
    return shuffledQuestions.take(count).toList();
  }

  void _startNextQuestion() {
    if (_currentQuestionIndex < _selectedQuestions.length) {
      _remainingTimeInSeconds = 60;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_remainingTimeInSeconds > 0) {
            _remainingTimeInSeconds--;
          } else {
            _goToNextQuestion();
          }
        });
      });
    } else {
      _timer.cancel();
      _showResult();
    }
  }

  void _goToNextQuestion() {
    _timer.cancel();
    setState(() {
      _currentQuestionIndex++;
    });
    _startNextQuestion();
  }

  void _showResult() {
    double percentage = (_correctAnswersCount / 20) * 100;

    String resultMessage;
    if (percentage >= 80) {
      resultMessage = 'مبروك لقد اجتزت الاختبار!';
      // انتقل إلى الصفحة الجديدة بعد اجتياز الاختبار
      Navigator.pop(context);
      print("مبروك لقد اجتزت الاختبار");
    } else {
      resultMessage =
          'للاسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق!';
      // انتقل إلى صفحة المحاضرة بعد رسوب المستخدم
      Navigator.pop(context);
      print(
          "للاسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق");
    }

    // عرض رسالة النتيجة
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(resultMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('حسنًا'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية الصفحة
      appBar: AppBar(
        title: const Text('اختبار Wordpress'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // سؤال
            if (_selectedQuestions.isNotEmpty &&
                _currentQuestionIndex < _selectedQuestions.length)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _selectedQuestions[_currentQuestionIndex]['question'],
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 20),
            if (_remainingTimeInSeconds > 0)
              // وقت السؤال
              Text(
                'الوقت المتبقي: $_remainingTimeInSeconds ثانية',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            const SizedBox(height: 20),
            if (_remainingTimeInSeconds > 0 &&
                _selectedQuestions.isNotEmpty &&
                _currentQuestionIndex < _selectedQuestions.length)
              // الخيارات
              Column(
                children: List.generate(
                  _selectedQuestions[_currentQuestionIndex]['options'].length,
                  (index) {
                    return ElevatedButton(
                      onPressed: () {
                        _checkAnswer(index);
                      },
                      child: Text(
                        _selectedQuestions[_currentQuestionIndex]['options']
                            [index],
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _checkAnswer(int selectedOptionIndex) {
    int correctOptionIndex =
        _selectedQuestions[_currentQuestionIndex]['correctOptionIndex'];

    if (selectedOptionIndex == correctOptionIndex) {
      _correctAnswersCount++;
    }

    _goToNextQuestion();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

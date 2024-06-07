import 'dart:async';
import 'package:flutter/material.dart';

import 'accountingadministrationpage19.dart';
import 'accountingadministrationpage20.dart';

class accountingadministrationtest19 extends StatefulWidget {
  const accountingadministrationtest19({super.key});

  @override
  accountingadministrationtest19State createState() =>
      accountingadministrationtest19State();
}

class accountingadministrationtest19State
    extends State<accountingadministrationtest19> {
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  int _remainingTimeInSeconds = 60; // مدة السؤال بالثواني

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'سؤال 1: ما هو الغرض الرئيسي لاستخدام منصة ووردبريس؟',
      'options': [
        'التجارة الإلكترونية',
        'إدارة المحتوى على المواقع',
        'تحليل البيانات',
        'تصميم الجرافيك'
      ],
      'correctOptionIndex': 1,
    },
    // ... أسئلة أخرى
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startNextQuestion();
  }

  void _startNextQuestion() {
    if (_currentQuestionIndex < _questions.length) {
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
    double percentage = (_correctAnswersCount / _questions.length) * 100;

    String resultMessage;
    if (percentage >= 80) {
      resultMessage = 'مبروك لقد اجتزت الاختبار!';
      // انتقل إلى الصفحة الجديدة بعد اجتياز الاختبار
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NewPage()),
      );
    } else {
      resultMessage =
          'للأسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق!';
      // انتقل إلى صفحة المحاضرة بعد رسوب المستخدم
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const accountingadministrationpage19(),
        ),
      );
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
        title: const Text('اختبار المحاضرة 19'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // سؤال
            if (_questions.isNotEmpty &&
                _currentQuestionIndex < _questions.length)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _questions[_currentQuestionIndex]['question'],
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
                _questions.isNotEmpty &&
                _currentQuestionIndex < _questions.length)
              // الخيارات
              Column(
                children: List.generate(
                  _questions[_currentQuestionIndex]['options'].length,
                  (index) {
                    return ElevatedButton(
                      onPressed: () {
                        _checkAnswer(index);
                      },
                      child: Text(
                        _questions[_currentQuestionIndex]['options'][index],
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
        _questions[_currentQuestionIndex]['correctOptionIndex'];

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

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('صفحة جديدة'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'مبروك، لقد اجتزت الاختبار ووصلت إلى الصفحة الجديدة!',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // انتقل إلى الصفحة الجديدة
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const accountingadministrationpage20()));
              },
              child: const Text('الانتقال للدرس التالي'),
            ),
          ],
        ),
      ),
    );
  }
}

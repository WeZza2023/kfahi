import 'dart:async';
import 'package:flutter/material.dart';
import 'Leadershippage8.dart';
import 'Leadershippage9.dart';

class Leadershiptest8 extends StatefulWidget {
  const Leadershiptest8({super.key});

  @override
  _Leadershiptest8State createState() => _Leadershiptest8State();
}

class _Leadershiptest8State extends State<Leadershiptest8> {
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  int _remainingTimeInSeconds = 60; // مدة السؤال بالثواني

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'سؤال 1: ما هو شلولح',
      'options': [
        ' مدونه اللكتونيه',
        'منصه انشاء مواقع نفتوح المصدر ',
        'منصه تحليل البيانات',
        'منصع تصميم الجرافيك'
      ],
      'correctOptionIndex': 1,
    },
    {
      'question': 'سؤال 2: ما هي اللغه المبني بها منصة الووردبريس؟',
      'options': [' dart', 'c++ ', 'php ', 'java '],
      'correctOptionIndex': 2,
    },
    {
      'question': ' ماذا يعني plugin',
      'options': ['اضافات ', 'ثيمات', ' البيانات', 'تصميم '],
      'correctOptionIndex': 0,
    },
    {
      'question': ' لماذا نستخدام منصة ووردبريس؟',
      'options': [
        'موقع مفتوح المصدر مجاني ',
        'سهل الاستخدام ',
        'اسرع موقع',
        'جميع ما سبق '
      ],
      'correctOptionIndex': 3,
    },
    {
      'question': ' Control panel ما هي  ',
      'options': [
        'ثيم الموقع ',
        'اضافه تسريع الموقه',
        'لوحه التحكم ',
        'نظام تحليل بينات '
      ],
      'correctOptionIndex': 2,
    },
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
          context, MaterialPageRoute(builder: (context) => const NewPage()));
    } else {
      resultMessage =
          'للاسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق!';
      // انتقل إلى صفحة المحاضرة بعد رسوب المستخدم
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Leadershippage8()));
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
        title: const Text('اختبار المحاضره 8'),
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Leadershippage9()));
              },
              child: const Text('الانتقال للدرس التالي'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'totpage50.dart';

class totpagetest50 extends StatefulWidget {
  const totpagetest50({super.key});

  @override
  _totpagetest50State createState() => _totpagetest50State();
}

class _totpagetest50State extends State<totpagetest50> {
  int _currentQuestionIndex = 0;
  int _correctAnswersCount = 0;
  int _remainingTimeInSeconds = 60; // مدة السؤال بالثواني
  late String _userName = '';
  late String _membershipNumber = '';

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
      _showCertificateDialog(); // عرض شهادة التقدير
    } else {
      resultMessage =
          'للاسف لقد رسبت في الاختبار. سيتم ارجاعك للمحاضرة مرة أخرى بالتوفيق!';
      // انتقل إلى صفحة المحاضرة بعد رسوب المستخدم
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const totpage50()));
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

  void _showCertificateDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('تقديم على الشهادة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('الرجاء تقديم طلب الشهادة:'),
              TextField(
                decoration: const InputDecoration(labelText: 'الاسم الثلاثي'),
                onChanged: (value) {
                  setState(() {
                    _userName = value;
                  });
                },
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'رقم العضوية الخاص بالطالب'),
                onChanged: (value) {
                  setState(() {
                    _membershipNumber = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _submitCertificateRequest();
                  Navigator.pop(context);
                },
                child: const Text('تقديم الطلب'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _submitCertificateRequest() async {
    final Email email = Email(
      body: 'الاسم الثلاثي: $_userName\n'
          'رقم العضوية: $_membershipNumber\n'
          'دورة TOT ',
      subject: 'طلب شهادة',
      recipients: ['k.islam.atef@gmail.com'],
    );

    try {
      await FlutterEmailSender.send(email);
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('فشل في إرسال البريد الإلكتروني'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية الصفحة
      appBar: AppBar(
        title: const Text('اختبار المحاضره الاخيره '),
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

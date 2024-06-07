import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/Ethicalhacking/Ethicalhackingpage.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage1.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/flutter/flutterpage1.dart';

import '../coursepages.dart';

void main() {
  runApp(const ProgrammingPage());
}

class ProgrammingPage extends StatefulWidget {
  const ProgrammingPage({super.key});

  @override
  _ProgrammingPageState createState() => _ProgrammingPageState();
}

class _ProgrammingPageState extends State<ProgrammingPage> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _scaffoldKey = GlobalKey<ScaffoldState>();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          _currentPageIndex = (_currentPageIndex + 1) % 4;
          _pageController.animateToPage(
            _currentPageIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // إضافة الأكواد التي تقوم بفتح القائمة المنسدلة هنا
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // العودة للصفحة السابقة
          },
        ),
        centerTitle: true,
        title:
            const Text('دورات البرمجه', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black, // تحديد لون خلفية الصفحة
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 2,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 4, // تحديد عدد الصور
              itemBuilder: (context, index) {
                return Image.asset(
                  index == 0
                      ? 'lib/assets/images/WordPress.png'
                      : (index == 1
                          ? 'lib/assets/images/Cyber Security.png'
                          : (index == 2
                              ? 'lib/assets/images/Web development.png'
                              : 'lib/assets/images/flutter.png')),
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Row(
            children: [
              Expanded(
                child: _buildButton(
                  'دورة الورد بريس',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WordPressDeveloperPage1(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'مسار فلاتر',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FlutterPage1(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60.0,
          ),
          Row(
            children: [
              Expanded(
                child: _buildButton(
                  'الصفحه السابقه ',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoursePages(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'الهكر الاخلاقي',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Ethicalhackingpage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black, // لون النص
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/coursepages.dart';
import 'package:kfahi/screens/MyPointsPage.dart';
import 'newspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double _buttonOpacity = 0.0;
  int _currentPageIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentPageIndex = (_currentPageIndex + 1) % 6; // تحديد الصفحة التالية
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _buttonOpacity = 1.0;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'الصفحة الرئيسية',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 6, // عدد الصور
                itemBuilder: (context, index) {
                  return Image.asset(
                    _getImagePath(index),
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: _buttonOpacity),
                        duration: const Duration(seconds: 1),
                        builder: (_, double value, __) {
                          return Opacity(
                            opacity: value,
                            child: AnimatedContainer(
                              height: 80,
                              width: 130,
                              duration: const Duration(seconds: 1),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(50.0), // حواف دائرية
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.3), // لون الظل
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset:
                                        const Offset(0, 3), // تحديد اتجاه الظل
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'المسابقات',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CoursePages()),
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: _buttonOpacity),
                          duration: const Duration(seconds: 1),
                          builder: (_, double value, __) {
                            return Opacity(
                              opacity: value,
                              child: AnimatedContainer(
                                height: 80,
                                width: 130,
                                duration: const Duration(seconds: 1),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                      50.0), // حواف دائرية
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3), // لون الظل
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          0, 3), // تحديد اتجاه الظل
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'الدورات',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Newspage()), // تغيير هنا
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: _buttonOpacity),
                          duration: const Duration(seconds: 1),
                          builder: (_, double value, __) {
                            return Opacity(
                              opacity: value,
                              child: AnimatedContainer(
                                height: 80,
                                width: 130,
                                duration: const Duration(seconds: 1),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                      50.0), // حواف دائرية
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3), // لون الظل
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          0, 3), // تحديد اتجاه الظل
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'الاخبار',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MyPointsPage()), // تغيير هنا
                      );
                    },
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: _buttonOpacity),
                          duration: const Duration(seconds: 1),
                          builder: (_, double value, __) {
                            return Opacity(
                              opacity: value,
                              child: AnimatedContainer(
                                height: 80,
                                width: 130,
                                duration: const Duration(seconds: 1),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                      50.0), // حواف دائرية
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.3), // لون الظل
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(
                                          0, 3), // تحديد اتجاه الظل
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.all(16.0),
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'نقاطي',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'lib/assets/images/Accounting.png';
      case 1:
        return 'lib/assets/images/Administration.png';
      case 2:
        return 'lib/assets/images/Marketing.png';
      case 3:
        return 'lib/assets/images/programming.png';
      case 4:
        return 'lib/assets/images/Technology.png';
      case 5:
        return 'lib/assets/images/design.png';
      default:
        return 'lib/assets/images/Accounting.png';
    }
  }
}

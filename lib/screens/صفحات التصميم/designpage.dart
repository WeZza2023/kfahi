import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%B5%D9%81%D8%AD%D8%A7%D8%AA%20%D8%A7%D9%84%D8%AA%D8%B5%D9%85%D9%8A%D9%85/%D9%81%D9%88%D8%AA%D9%88%20%D8%B4%D9%88%D8%A8/lecs_page.dart';
import 'package:kfahi/screens/coursepages.dart';
import 'UL UX/UIUXpage.dart';
import 'UL UX/lecs_page.dart';
import 'canva/canvapage.dart';
import 'canva/lecs_page.dart';
import 'فوتو شوب/photo_shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: designpage(),
    );
  }
}

class designpage extends StatefulWidget {
  const designpage({super.key});

  @override
  _designpageState createState() => _designpageState();
}

class _designpageState extends State<designpage> {
  late PageController _pageController;
  int _currentPageIndex = 0;
  late GlobalKey<ScaffoldState> _scaffoldKey;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _scaffoldKey = GlobalKey<ScaffoldState>();

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          _currentPageIndex =
              (_currentPageIndex + 1) % 4; // تم تعديلها لتشمل 4 صور
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
            const Text('دورات التصميم', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black, // تحديد لون خلفية الصفحة
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 2,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 3, // تحديد عدد الصور
              itemBuilder: (context, index) {
                return Image.asset(
                  index == 0
                      ? 'lib/assets/images/ulux.png'
                      : (index == 1
                          ? 'lib/assets/images/Canva .png'
                          : 'lib/assets/images/Photoshop.png'),
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
                  'UL UX',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UIUXLecsPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'فوتو شوب',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoShopLecsPage(),
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
                  'canva',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CanvaLecsPage(),
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

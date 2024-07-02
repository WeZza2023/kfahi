import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%B5%D9%81%D8%AD%D8%A7%D8%AA%20%D8%A7%D9%84%D8%AA%D8%B3%D9%88%D9%8A%D9%82/E-Marketing/lecs_page.dart';
import 'package:kfahi/screens/%D8%B5%D9%81%D8%AD%D8%A7%D8%AA%20%D8%A7%D9%84%D8%AA%D8%B3%D9%88%D9%8A%D9%82/seo/lecs_page.dart';
import 'ContentWritin/lecs_page.dart';
import 'Customer service/lecs_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Marketingpage(),
    );
  }
}

class Marketingpage extends StatefulWidget {
  const Marketingpage({super.key});

  @override
  _MarketingpageState createState() => _MarketingpageState();
}

class _MarketingpageState extends State<Marketingpage> {
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
            const Text('دورات التسويق', style: TextStyle(color: Colors.white)),
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
                      ? 'lib/assets/images/seo.png'
                      : (index == 1
                          ? 'lib/assets/images/E-Marketing.png'
                          : (index == 2
                              ? 'lib/assets/images/Customerservice.png'
                              : 'lib/assets/images/ContentWriting.png')),
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
                  'seo',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SeoLecsPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'E-Marketing',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EMarketingLecsPage(),
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
                  'Customer service',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomerServiceLecsPage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'Content Writing',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContentWritingLecsPage(),
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
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black, // لون النص
                  fontSize: 20,
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

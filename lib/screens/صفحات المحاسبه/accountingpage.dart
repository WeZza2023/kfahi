import 'dart:async';
import 'package:flutter/material.dart';
import 'Cost accounting/Costaccountingpage1.dart';
import 'Financial accounting/Financialaccountingpage.dart';
import 'Tax accounting/Taxaccountingpage.dart';
import 'accounting administration/accountingadministrationpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: accountingpage(),
    );
  }
}

class accountingpage extends StatefulWidget {
  const accountingpage({super.key});

  @override
  _accountingpageState createState() => _accountingpageState();
}

class _accountingpageState extends State<accountingpage> {
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
            const Text('دورات المحاسبه', style: TextStyle(color: Colors.white)),
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
                      ? 'lib/assets/images/Tax accounting.png'
                      : (index == 1
                          ? 'lib/assets/images/Financial accounting.png'
                          : (index == 2
                              ? 'lib/assets/images/Cost accounting.png'
                              : 'lib/assets/images/accounting administration.png')),
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
                  'المحاسبه الماليه',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Financialaccountingpage(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'المحاسبه الاداريه',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const accountingadministrationpage(),
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
                  'محاسبه التكاليف',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Costaccountingpage1(),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: _buildButton(
                  'المحاسبه الضريبيه',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Taxaccountingpage(),
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

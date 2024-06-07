import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() {
  runApp(const Newspage());
}

class Newspage extends StatelessWidget {
  const Newspage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'صفحة الأخبار',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert,
                  color: Colors.white), // أيقونة الشروط الثلاثة
              onSelected: (String value) {
                // تنفيذ الإجراء بناءً على الخيار المحدد
                switch (value) {
                  case 'شرط 1':
                    // Add your action here
                    break;
                  case 'شرط 2':
                    // Add your action here
                    break;
                  case 'شرط 3':
                    // Add your action here
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'شرط 1',
                    child: Text('شرط 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'شرط 2',
                    child: Text('شرط 2'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'شرط 3',
                    child: Text('شرط 3'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/images/logo.x.png'),
                const SizedBox(height: 20), // Add spacing below the logo
                SizedBox(
                  height: 50, // تعديل ارتفاع عنصر Marquee
                  child: Marquee(
                    text:
                        'انتظروا قريبًا كورس اللغة الإنجليزية - قريبًا مسابقة للمصممين - قريبًا كورس تعلم أدوات الذكاء الاصطناعي',
                    velocity: 40,
                    pauseAfterRound: const Duration(seconds: 1),
                    startPadding: 10,
                    accelerationDuration: const Duration(seconds: 1),
                    accelerationCurve: Curves.linear,
                    decelerationDuration: const Duration(milliseconds: 500),
                    decelerationCurve: Curves.easeOut,
                    style: const TextStyle(
                      fontSize: 24, // Increase font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the start
                    textDirection: TextDirection.rtl, // Change text direction
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

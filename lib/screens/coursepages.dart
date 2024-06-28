import 'package:flutter/material.dart';
import 'البرمجه/Programmingpage.dart';
import 'صفحات الاداره/Administrationpage.dart';
import 'صفحات التسويق/Marketingpage.dart';
import 'صفحات التصميم/designpage.dart';
import 'صفحات التكنولوجيا/Technologypage.dart';
import 'صفحات المحاسبه/accountingpage.dart';

void main() {
  runApp(const CoursePages());
}

class CoursePages extends StatelessWidget {
  const CoursePages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: const Text(
            'الدورات التدريبية',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RectangleButton(
                    color: Colors.black,
                    label: "البرمجة",
                    imagePath: "lib/assets/images/Programming.x.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgrammingPage(),
                        ),
                      );
                    },
                  ),
                  RectangleButton(
                    color: Colors.black,
                    label: "الإدارة",
                    imagePath: "lib/assets/images/Administration.x.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Administrationpage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RectangleButton(
                    color: Colors.black,
                    label: "المحاسبة",
                    imagePath: "lib/assets/images/Accounting.x.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const accountingpage(),
                        ),
                      );
                    },
                  ),
                  RectangleButton(
                    color: Colors.black,
                    label: "التكنولوجيا",
                    imagePath: "lib/assets/images/Technology.x.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Technologypage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RectangleButton(
                    color: Colors.black,
                    label: "التسويق",
                    imagePath: "lib/assets/images/Marketing.x.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Marketingpage(),
                        ),
                      );
                    },
                  ),
                  RectangleButton(
                    color: Colors.black,
                    label: "التصميم",
                    imagePath: "lib/assets/images/design.x.png",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const designpage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RectangleButton extends StatelessWidget {
  final Color color;
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const RectangleButton({
    super.key,
    required this.color,
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade800),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

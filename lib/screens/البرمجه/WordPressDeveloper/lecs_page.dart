import 'package:flutter/material.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage1.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage2.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage22.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage3.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage49.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage50.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage51.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage52.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage53.dart';
import 'package:kfahi/screens/%D8%A7%D9%84%D8%A8%D8%B1%D9%85%D8%AC%D9%87/WordPressDeveloper/WordPressDeveloperPage54.dart';

import 'WordPressDeveloperPage10.dart';
import 'WordPressDeveloperPage11.dart';
import 'WordPressDeveloperPage12.dart';
import 'WordPressDeveloperPage13.dart';
import 'WordPressDeveloperPage14.dart';
import 'WordPressDeveloperPage15.dart';
import 'WordPressDeveloperPage16.dart';
import 'WordPressDeveloperPage17.dart';
import 'WordPressDeveloperPage18.dart';
import 'WordPressDeveloperPage19.dart';
import 'WordPressDeveloperPage20.dart';
import 'WordPressDeveloperPage21.dart';
import 'WordPressDeveloperPage23.dart';
import 'WordPressDeveloperPage24.dart';
import 'WordPressDeveloperPage25.dart';
import 'WordPressDeveloperPage26.dart';
import 'WordPressDeveloperPage27.dart';
import 'WordPressDeveloperPage28.dart';
import 'WordPressDeveloperPage29.dart';
import 'WordPressDeveloperPage30.dart';
import 'WordPressDeveloperPage31.dart';
import 'WordPressDeveloperPage32.dart';
import 'WordPressDeveloperPage33.dart';
import 'WordPressDeveloperPage34.dart';
import 'WordPressDeveloperPage35.dart';
import 'WordPressDeveloperPage36.dart';
import 'WordPressDeveloperPage37.dart';
import 'WordPressDeveloperPage38.dart';
import 'WordPressDeveloperPage39.dart';
import 'WordPressDeveloperPage4.dart';
import 'WordPressDeveloperPage40.dart';
import 'WordPressDeveloperPage41.dart';
import 'WordPressDeveloperPage42.dart';
import 'WordPressDeveloperPage43.dart';
import 'WordPressDeveloperPage44.dart';
import 'WordPressDeveloperPage45.dart';
import 'WordPressDeveloperPage46.dart';
import 'WordPressDeveloperPage47.dart';
import 'WordPressDeveloperPage48.dart';
import 'WordPressDeveloperPage5.dart';
import 'WordPressDeveloperPage6.dart';
import 'WordPressDeveloperPage7.dart';
import 'WordPressDeveloperPage8.dart';
import 'WordPressDeveloperPage9.dart';

class EthicalhackingLecsPage extends StatelessWidget {
  EthicalhackingLecsPage({super.key});

  final List lectures = [
    WordPressDeveloperPage1(),
    WordPressDeveloperPage2(),
    WordPressDeveloperPage3(),
    WordPressDeveloperPage4(),
    WordPressDeveloperPage5(),
    WordPressDeveloperPage6(),
    WordPressDeveloperPage7(),
    WordPressDeveloperPage8(),
    WordPressDeveloperPage9(),
    WordPressDeveloperPage10(),
    WordPressDeveloperPage11(),
    WordPressDeveloperPage12(),
    WordPressDeveloperPage13(),
    WordPressDeveloperPage14(),
    WordPressDeveloperPage15(),
    WordPressDeveloperPage16(),
    WordPressDeveloperPage17(),
    WordPressDeveloperPage18(),
    WordPressDeveloperPage19(),
    WordPressDeveloperPage20(),
    WordPressDeveloperPage21(),
    WordPressDeveloperPage22(),
    WordPressDeveloperPage23(),
    WordPressDeveloperPage24(),
    WordPressDeveloperPage25(),
    WordPressDeveloperPage26(),
    WordPressDeveloperPage27(),
    WordPressDeveloperPage28(),
    WordPressDeveloperPage29(),
    WordPressDeveloperPage30(),
    WordPressDeveloperPage31(),
    WordPressDeveloperPage32(),
    WordPressDeveloperPage33(),
    WordPressDeveloperPage34(),
    WordPressDeveloperPage35(),
    WordPressDeveloperPage36(),
    WordPressDeveloperPage37(),
    WordPressDeveloperPage38(),
    WordPressDeveloperPage39(),
    WordPressDeveloperPage40(),
    WordPressDeveloperPage41(),
    WordPressDeveloperPage42(),
    WordPressDeveloperPage43(),
    WordPressDeveloperPage44(),
    WordPressDeveloperPage45(),
    WordPressDeveloperPage46(),
    WordPressDeveloperPage47(),
    WordPressDeveloperPage48(),
    WordPressDeveloperPage49(),
    WordPressDeveloperPage50(),
    WordPressDeveloperPage51(),
    WordPressDeveloperPage52(),
    WordPressDeveloperPage53(),
    WordPressDeveloperPage54(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // العودة للصفحة السابقة
          },
        ),
        centerTitle: true,
        title: const Text('المحاضرات', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return lectures[index];
                        },
                      ));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                      child: Center(
                          child: Text(
                        (index + 1).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                padding: EdgeInsets.all(15),
                itemCount: lectures.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

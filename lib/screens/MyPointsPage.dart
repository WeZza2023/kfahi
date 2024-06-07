import 'package:flutter/material.dart';

class MyPointsPage extends StatefulWidget {
  const MyPointsPage({super.key});

  @override
  _MyPointsPageState createState() => _MyPointsPageState();
}

class _MyPointsPageState extends State<MyPointsPage> {
  double _imageHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('برنامج نقاطي'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageSection(
                imagePath: 'lib/assets/images/logo.jpg',
                height: _imageHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'مرحبا عزيزي الزائر في منصة كفاحي',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                'لنتعرف على برنامج نقاطي',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildImageSection(
                imagePath: 'lib/assets/images/points.jpg',
                height: _imageHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'برنامج نقاطي هو برنامج مكافآت يمنحك بعض المكافآت بناءً على حماسك ويساعدك في التحفيز والحصول على المزيد من الدورات التدريبية.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildImageSection(
                imagePath: 'lib/assets/images/bag.jpg',
                height: _imageHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'الجائزة الأولى: شنطه المتدرب عند الوصول إلى 500 نقطة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildImageSection(
                imagePath: 'lib/assets/images/Mobile.jpg',
                height: _imageHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'الجائزة الثانية: موبايل عند الوصول إلى 1500 نقطة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildImageSection(
                imagePath: 'lib/assets/images/Laptop.jpg',
                height: _imageHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'الجائزة الثالثة: لاب توب عند الوصول إلى 3000 نقطة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              _buildImageSection(
                imagePath: 'lib/assets/images/money.jpg',
                height: _imageHeight,
              ),
              const SizedBox(height: 20),
              const Text(
                'الجائزة الرابعة: 100,000 جنيه نقدي عند الوصول إلى 6000 نقطة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'وهناك جوائز أخرى كثيرة ومسابقات. لا تضيع فرصتك، انضم إلينا الآن!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(
      {required String imagePath, required double height}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Increase the image height when tapped
          if (_imageHeight == 100.0) {
            _imageHeight = 300.0;
          } else {
            _imageHeight = 100.0;
          }
        });
      },
      child: Image.asset(
        imagePath,
        height: height,
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kfahi/firebase_options.dart';
import 'package:kfahi/screens/auth/SignInScreen.dart';
import 'package:kfahi/screens/auth/Signup.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kfahi/screens/contactus-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'KFAHI',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top section with logo
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('lib/assets/images/logo.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(0),
                      bottomRight: Radius.circular(
                          MediaQuery.of(context).size.width * 0.4),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Bottom section with buttons and text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // لون الزر
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold), // نوع الخط
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white, // لون الكتابة
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Signup()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // لون الزر
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0), // نوع الخط
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white, // لون الكتابة
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactusPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // لون الزر
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold), // نوع الخط
                  ),
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white, // لون الكتابة
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://kfahi.com/';
                    await _launchURL(url);
                  },
                  child: const Text(
                    'www.kfahi.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold, // جعل النص بولد
                      decorationThickness: 2.0, // سمك التسطير
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://bit.ly/3Dxkk5c';
                        await _launchURL(url);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://www.youtube.com/@KFAHI';
                        await _launchURL(url);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.youtube,
                        color: Colors.red,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://www.youtube.com/@KFAHI';
                        await _launchURL(url);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://bit.ly/3Y8c30Q';
                        await _launchURL(url);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.telegram,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

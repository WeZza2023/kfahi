import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kfahi/screens/CustomerServicePage.dart';
import 'package:kfahi/screens/auth/SignInScreen.dart';
import 'package:kfahi/screens/auth/Signup.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KFAHI',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.black,
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/logo.jpeg'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        child: SvgPicture.asset('assets/icon1.svg'),
                      ),
                      GestureDetector(
                        child: SvgPicture.asset('assets/icon2.svg'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(FontAwesomeIcons.facebook),
                iconSize: 40,
                color: const Color.fromARGB(255, 7, 11, 243),
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://www.facebook.com/profile.php?id=100087047154137'));
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.youtube),
                iconSize: 40,
                color: const Color.fromARGB(255, 240, 15, 15),
                onPressed: () {
                  launchUrl(Uri.parse('https://www.youtube.com/@KFAHI'));
                },
              ),
              IconButton(
                icon: const Icon(FontAwesomeIcons.telegram),
                iconSize: 40,
                color: const Color.fromARGB(255, 53, 57, 250),
                onPressed: () {
                  launchUrl(Uri.parse('https://t.me/+bAHfppN-0jE2MjI0'));
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 248, 19, 19),
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Signup()));
                      },
                      child: const Text('تسجيل طلب',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 248, 19, 19),
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                      },
                      child: const Text('تسجيل الدخول',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 248, 19, 19),
                        minimumSize: const Size(200, 50),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CustomerServicePage()));
                      },
                      child: const Text('خدمة العملاء',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: const Text(
                        'www.kfahi.com',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      onTap: () {
                        launchUrl(Uri.parse('https://www.kfahi.com'));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContactusPage extends StatefulWidget {
  const ContactusPage({super.key});

  @override
  State<ContactusPage> createState() => _ContactusPageState();
}

class _ContactusPageState extends State<ContactusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خدمة العملاء')),
      body: const Center(
        child: Text(
          'خدمة العملاء',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}

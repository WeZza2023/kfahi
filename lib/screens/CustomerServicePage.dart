import 'package:flutter/material.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
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

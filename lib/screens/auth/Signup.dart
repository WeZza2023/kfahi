import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() async {
  runApp(const MaterialApp());
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final db = FirebaseFirestore.instance;

  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to check if all fields are filled
  bool isAllFieldsFilled() {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  // Function to handle sign up with Firebase
  Future<void> signUpWithEmailPassword() async {
    try {
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final user = <String, dynamic>{
        // "uid": FirebaseAuth.instance.currentUser!.uid,
        "active": false,
        "first": nameController.text,
      };

      await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user);

      // Navigate to RegistrationConfirmationPage after successful registration
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationConfirmationPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e.message);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Add code to open the dropdown menu here
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'تسجيل العضوية',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/logo.x.png',
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height / 1,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'الاسم',
                hintText: 'أدخل اسمك',
                controller: nameController,
              ),
              CustomTextField(
                label: 'رقم الهاتف',
                hintText: 'أدخل رقم هاتفك',
                keyboardType: TextInputType.phone,
                controller: phoneController,
              ),
              CustomTextField(
                label: 'البريد الإلكتروني',
                hintText: 'أدخل البريد الإلكتروني',
                controller: emailController,
              ),
              CustomTextField(
                label: 'الدولة',
                hintText: 'اختر دولتك',
                controller: countryController,
              ),
              CustomTextField(
                label: 'كلمة المرور',
                hintText: 'أدخل كلمة المرور',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isAllFieldsFilled() ? signUpWithEmailPassword : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.grey),
                ), // Disable button if not all fields are filled
                child: const Text(
                  'التسجيل',
                  style: TextStyle(
                    color: Colors.white, // تعيين اللون الأبيض
                    fontSize: 18, // حجم الخط
                    fontWeight: FontWeight.bold, // نص بخط عريض
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          // لون النص الأبيض
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          // لون النص الأبيض
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(color: Colors.white), // تعيين لون النص ال
      ),
    );
  }
}

class RegistrationConfirmationPage extends StatefulWidget {
  const RegistrationConfirmationPage({super.key});

  @override
  State<RegistrationConfirmationPage> createState() =>
      _RegistrationConfirmationPageState();
}

class _RegistrationConfirmationPageState
    extends State<RegistrationConfirmationPage> {
  late String orderNumber = '';
  final String phoneNumber = '+201025173298';

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  Future<void> getUserId() async {
    setState(() {
      orderNumber = FirebaseAuth.instance.currentUser!.uid.toString();
    });
  }

  void _launchWhatsApp() async {
    final url = "https://wa.me/$phoneNumber";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: orderNumber));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Center(child: Text('تم نسخ رقم الطلب'))),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Replace the '12345' with the actual order number sent to the user

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'تم تسجيل العضوية بنجاح!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'رقم الطلب: $orderNumber',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchWhatsApp();
              },
              child: const Text('فتح تذكرة في خدمة العملاء'),
            ),
            ElevatedButton(
              onPressed: () {
                _copyCode();
              },
              child: const Text('نسخ الكود'),
            ),
          ],
        ),
      ),
    );
  }
}

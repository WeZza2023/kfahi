import 'package:flutter/material.dart';
import 'package:kfahi/screens/firstpage.dart';
import 'Signup.dart';

void main() async {
  runApp(const MaterialApp(
    home: SignInScreen(),
  ));
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Controllers for text fields
  TextEditingController usernameController = TextEditingController();
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
    return usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
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
          'تسجيل الدخول',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, // Fill the width of the screen
          height: MediaQuery.of(context)
              .size
              .height, // Fill the height of the screen
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
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/logo.x.png',
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: 'اسم المستخدم',
                hintText: 'أدخل اسم المستخدم',
                controller: usernameController,
              ),
              CustomTextField(
                label: 'كلمة المرور',
                hintText: 'أدخل كلمة المرور',
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isAllFieldsFilled()
                    ? () {
                        // Navigate to FirstPage without opening a new page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstPage(),
                          ),
                        );
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.grey),
                ), // Disable button if not all fields are filled
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: Colors.white, // تعيين اللون الأبيض
                    fontSize: 18, // حجم الخط
                    fontWeight: FontWeight.bold, // نص بخط عريض
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to SignupScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'تسجيل حساب',
                  style: TextStyle(
                    color: Colors.white, // تعيين اللون الأبيض
                    fontSize: 18, // حجم الخط
                    fontWeight: FontWeight.bold, // نص بخط عريض
                  ),
                ),
              ),
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
        style: const TextStyle(color: Colors.white), // لون النص المدخل أبيض
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white), // لون النص الأبيض
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white), // لون النص الأبيض
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

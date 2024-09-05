import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/sing_up/sign_up_state.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../components/components.dart';
import '../../shared_prefs/network.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final db = FirebaseFirestore.instance;
  String orderNumber = '';
  String phoneNumber = '+201025173298';

  Future<void> signUpWithEmailPassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      emit(SignUpLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = <String, dynamic>{
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "first": name,
        "email": email,
        "phone": phone,
        "active": false,
        "my_points": '0'
      };

      await db
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user);

      await getUserId();
      CacheHelper.saveData(key: 'email', value: email);
      CacheHelper.saveData(
        key: 'password',
        value: password,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(WeakPasswordState());
      } else if (e.code == 'invalid-email' ||
          e.code == 'email-already-in-use') {
        emit(InvalidEmailState());
      } else {
        print(e.code);
        emit(SignUpErrorState());
      }
    } catch (e) {
      emit(SignUpErrorState());
      print(e.toString());
    }
  }

  Future<void> getUserId() async {
    orderNumber = FirebaseAuth.instance.currentUser!.uid.toString();
  }

  void launchWhatsApp() async {
    final url = "https://wa.me/$phoneNumber";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void copyCode({
    required BuildContext context,
  }) {
    Clipboard.setData(ClipboardData(text: orderNumber));
    ScaffoldMessenger.of(context).showSnackBar(
      AppSnackBar(message: 'تم نسخ رقم الطلب'),
    );
  }
}

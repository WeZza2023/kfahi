import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/sign_in/sign_in_state.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../shared_prefs/network.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      emit(SignInLoadingState());
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if the user's account is active
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists && userDoc['active'] == true) {
        CacheHelper.saveData(key: 'email', value: userCredential.user!.email);
        CacheHelper.saveData(
          key: 'password',
          value: password,
        );
        emit(SignInSuccessState());
      } else {
        await FirebaseAuth.instance.signOut();
        emit(InActiveState());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        emit(SignInErrorState());
      } else {
        emit(SignInErrorState());
        print(e.code);
      }
    }
  }

  Future<void> autoSignIn() async {
    try {
      emit(AutoSignInLoadingState());
      String? email = await CacheHelper.getData(key: 'email');
      String? password = await CacheHelper.getData(key: 'password');
      if (email != null && password != null) {
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          emit(AutoSignInSuccessState());
        } on FirebaseAuthException catch (e) {
          print(e.code);
          emit(AutoSignInFailedState());
        }
      } else {
        emit(AutoSignInFailedState());
      }
    } catch (e) {
      emit(AutoSignInFailedState());
      print(e);
    }
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

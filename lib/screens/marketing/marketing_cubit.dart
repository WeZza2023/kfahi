import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'marketing_state.dart';

class MarketingCubit extends Cubit<MarketingState> {
  MarketingCubit() : super(MarketingInitial());
  List<int> doneLecs = [];

  int tabIndex = 0;

  void changeTabIndex({int? currentTab}) {
    tabIndex = currentTab!;

    emit(ChangeTabIndexState());
  }

  Future<void> getDoneLecs({required String docName}) async {
    emit(GetCourseLoadingState());
    try {
      final db = FirebaseFirestore.instance;
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      final docRef = db
          .collection('users')
          .doc(userUid)
          .collection("courses")
          .doc(docName);
      final snapshot = await docRef.get();
      if (snapshot.exists) {
        List<dynamic> done = snapshot.get('DoneLecs');
        doneLecs = done.cast<int>();
        print(doneLecs);
        emit(GetCourseDoneState());
      } else {
        await docRef.set({'DoneLecs': []});
        emit(GetCourseDoneState());
      }
    } on Exception catch (e) {
      print(e);
      emit(GetCourseErrorState());
    }
  }
}

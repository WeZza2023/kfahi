import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/screens/pharmacy/pharmacy_state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(InitPharmacyState());

  List<int> doneLecs = [];

  int tabIndex = 0;

  void changeTabIndex({int? currentTab}) {
    tabIndex = currentTab!;

    emit(ChangeTabIndexState());
  }

  Future<void> getDoneLecs(
      {required String docName,
      bool isCourse = false,
      String? collageName}) async {
    emit(GetCourseLoadingState());
    try {
      final db = FirebaseFirestore.instance;
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      final docRef = isCourse == true
          ? db
              .collection('users')
              .doc(userUid)
              .collection("courses")
              .doc(docName)
          : db
              .collection('users')
              .doc(userUid)
              .collection("collages")
              .doc(collageName)
              .collection('lectures')
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

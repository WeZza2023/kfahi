import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kfahi/models/news_model.dart';
import 'package:logger/logger.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late NewsModel? newsModel;
  String myPoints = "0";

  Future<void> getNews() async {
    try {
      emit(GetNewsLoadingState());
      FirebaseFirestore.instance
          .collection('news')
          .doc('main news')
          .snapshots()
          .listen((DocumentSnapshot<Map<String, dynamic>> newsDoc) {
        if (newsDoc.exists) {
          newsModel = NewsModel.fromJson(newsDoc.data()!);
          emit(GetNewsSuccessState(newsModel!));
        } else {
          print("no news");
          emit(GetNewsErrorState());
        }
      });
    } catch (e) {
      print(e);
      emit(GetNewsErrorState());
    }
  }

  void updateUserActivation() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Create a new batch
    WriteBatch batch = firestore.batch();

    // Get all users
    QuerySnapshot querySnapshot = await firestore.collection('users').get();

    // Iterate over each document
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Reference to the current document
      DocumentReference docRef = doc.reference;

      // Update the document in the batch
      batch.update(docRef, {'my_points': '0'});
    }

    // Commit the batch
    await batch.commit();

    print("All users have been updated successfully!");
  }

  Future<void> getMyPoints() async {
    try {
      emit(GetMyPointsLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .listen((DocumentSnapshot<Map<String, dynamic>> userDoc) {
        if (userDoc.exists && userDoc.data() != null) {
          myPoints = userDoc.data()!['my_points'];
          emit(GetMyPointsSuccessState());
        }
      });
    } catch (e) {
      print(e);
      emit(GetMyPointsErrorState());
    }
  }
}

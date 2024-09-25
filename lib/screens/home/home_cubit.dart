import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kfahi/models/initiatives_model.dart';
import 'package:kfahi/models/news_model.dart';
import 'package:kfahi/models/notifications_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../models/user_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late NewsModel? newsModel;
  late NotificationsModel? notificationsModel;
  UserModel? userModel;
  InitiativesModel? initiativesModel;
  String myPoints = "0";
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage;
  YoutubePlayerController? youtubePlayerController;

  bool? isInitiativesFullScreen = false;

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
      batch.update(docRef, {
        'notifications': {'main_notifications': []}
      });
    }

    // Commit the batch
    await batch.commit();

    print("All users have been updated successfully!");
  }

  Future<void> getMyProfile() async {
    try {
      emit(GetMyProfileLoadingState());
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      userModel = UserModel.fromJson(userDoc.data()!);
      emit(GetMyProfileSuccessState(userModel!));
    } catch (e) {
      print(e);
      emit(GetMyProfileErrorState());
    }
  }

  Future<void> getMyNotifications() async {
    try {
      emit(GetMyNotificationsLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .listen((DocumentSnapshot<Map<String, dynamic>> userDoc) {
        if (userDoc.exists && userDoc.data() != null) {
          notificationsModel =
              NotificationsModel.fromJson(userDoc.data()!['notifications']);
          emit(GetMyNotificationsSuccessState(notificationsModel!));
        }
      });
    } catch (e) {
      print(e);
      emit(GetMyNotificationsErrorState());
    }
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

  Future<void> updateProfile() async {
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImage = image;
      emit(PickImageSuccessState());
      await upLoadProfile();
      await getMyProfile();
    } else {
      print('no image');
      emit(PickImageErrorState());
    }
  }

  Future<void> upLoadProfile() async {
    try {
      emit(UpdateProfileLoadingState());
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profileImage/${FirebaseAuth.instance.currentUser!.uid}.jpg');
      await ref.putFile(File(pickedImage!.path));
      String profileUrl = '';
      await ref.getDownloadURL().then((value) {
        profileUrl = value;
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'profile': profileUrl});
      emit(UpdateProfileSuccessState());
    } catch (e) {
      print(e);
      emit(UpdateProfileErrorState());
    }
  }

  Future<void> getInitiatives() async {
    try {
      emit(GetInitiativesLoadingState());
      DocumentSnapshot<Map<String, dynamic>> InitiativesDoc =
          await FirebaseFirestore.instance
              .collection('initiatives')
              .doc('initiatives')
              .get();
      initiativesModel = InitiativesModel.fromJson(InitiativesDoc.data()!);
      emit(GetInitiativesSuccessState(initiativesModel!));
    } catch (e) {
      print(e);
      emit(GetInitiativesErrorState());
    }
  }

  Future<void> initVideoController({required String videoId}) async {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      // تحديث معرف الفيديو الجديد هنا
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        hideControls: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );

    youtubePlayerController?.addListener(() async {
      if (youtubePlayerController?.value.playerState == PlayerState.ended) {
        youtubePlayerController?.pause();
      }

      if (youtubePlayerController?.value.isFullScreen == true) {
        print('FullScreen');
      }
    });

    emit(InitControllerState());
  }
}

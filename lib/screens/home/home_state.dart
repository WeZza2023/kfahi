import 'package:kfahi/models/initiatives_model.dart';
import 'package:kfahi/models/news_model.dart';
import 'package:kfahi/models/notifications_model.dart';
import 'package:kfahi/models/user_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetNewsLoadingState extends HomeState {}

class GetNewsSuccessState extends HomeState {
  final NewsModel newsModel;

  GetNewsSuccessState(this.newsModel);
}

class GetNewsErrorState extends HomeState {}

class GetMyPointsLoadingState extends HomeState {}

class GetMyPointsSuccessState extends HomeState {}

class GetMyPointsErrorState extends HomeState {}

class GetMyNotificationsLoadingState extends HomeState {}

class GetMyNotificationsSuccessState extends HomeState {
  final NotificationsModel notificationsModel;

  GetMyNotificationsSuccessState(this.notificationsModel);
}

class GetMyNotificationsErrorState extends HomeState {}

class GetMyProfileLoadingState extends HomeState {}

class GetMyProfileSuccessState extends HomeState {
  final UserModel userModel;

  GetMyProfileSuccessState(this.userModel);
}

class GetMyProfileErrorState extends HomeState {}

class PickImageSuccessState extends HomeState {}

class PickImageErrorState extends HomeState {}

class UpdateProfileLoadingState extends HomeState {}

class UpdateProfileSuccessState extends HomeState {}

class UpdateProfileErrorState extends HomeState {}

class InitControllerState extends HomeState {}

class GetInitiativesLoadingState extends HomeState {}

class GetInitiativesSuccessState extends HomeState {
  final InitiativesModel initiativesModel;

  GetInitiativesSuccessState(this.initiativesModel);
}

class GetInitiativesErrorState extends HomeState {}

class ChangeExpandedIndexState extends HomeState {}

class ToggleFullScreenState extends HomeState {}

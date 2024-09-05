import 'package:kfahi/models/news_model.dart';

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

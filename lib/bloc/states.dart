// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sourse_response_model.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeGetSourcesLoadingsState extends HomeState {}

class HomeGetSourcesSuccessState extends HomeState {
  SourseResponse sourseResponse;
  HomeGetSourcesSuccessState(
    this.sourseResponse,
  );
}

class HomeGetSourcesErrorState extends HomeState {
  String error;
  HomeGetSourcesErrorState(this.error);
}

class HomeGetNewsDataLoadingsState extends HomeState {}

class HomeGetNewsDataSuccesssState extends HomeState {
  NewsDataResponse newsDataResponse;
  HomeGetNewsDataSuccesssState(this.newsDataResponse);
}

class HomeGetNewsDataErrorsState extends HomeState {
  String error;
  HomeGetNewsDataErrorsState(this.error);
}

class ChangeSourseState extends HomeState {}

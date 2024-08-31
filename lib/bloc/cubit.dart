import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sourse_response_model.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo repo;
  HomeCubit(this.repo) : super(HomeInitState());
  NewsDataResponse? newsDataResponse;
  SourseResponse? sourseResponse;
  int selectedSourceIndex = 0;

  static HomeCubit get(context) => BlocProvider.of(context);
  Future<void> getSources({String? id, String? query}) async {
    try {
      emit(HomeGetSourcesLoadingsState());
      SourseResponse sourseResponse = await repo.getSources(id: id);
      this.sourseResponse = sourseResponse;
      getNewsData(sourseResponse.sources![selectedSourceIndex].id!);
      emit(HomeGetSourcesSuccessState(sourseResponse));
    } catch (e) {
      emit(HomeGetSourcesErrorState("something went wrong"));
    }
  }

  //get news data

  Future<void> getNewsData(String sourceId) async {
    try {
      emit(HomeGetNewsDataLoadingsState());
      NewsDataResponse newsDataResponse = await repo.getNewsData(sourceId);

      this.newsDataResponse = newsDataResponse;
      emit(HomeGetNewsDataSuccesssState(newsDataResponse));
    } catch (e) {
      emit(HomeGetNewsDataErrorsState("soething went wrong"));
    }
  }

  // change selectedIndex
  changeSourseIndex(int index) async {
    selectedSourceIndex = index;
    newsDataResponse = null;
    sourseResponse = null;
    await Future.delayed(Duration(microseconds: 500));
    emit(ChangeSourseState());
  }
}

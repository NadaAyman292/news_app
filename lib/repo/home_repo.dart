import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sourse_response_model.dart';

abstract class HomeRepo {
  Future<SourseResponse> getSources({String? id, String? query});
  Future<NewsDataResponse> getNewsData(String sourceId);
}

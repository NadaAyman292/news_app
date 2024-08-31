import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sourse_response_model.dart';
import 'package:news_app/repo/home_repo.dart';

class HomeLocalRepoImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) {
    // TODO: implement getNewsData
    throw UnimplementedError();
  }

  @override
  Future<SourseResponse> getSources({String? id, String? query}) {
    // TODO: implement getSources
    throw UnimplementedError();
  }
}

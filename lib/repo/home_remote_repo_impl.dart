import 'dart:convert';

import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sourse_response_model.dart';
import 'package:news_app/repo/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRemoteRepoImpl implements HomeRepo {
  @override
  Future<NewsDataResponse> getNewsData(String sourceId) async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        "apiKey": "d1ed2239dec843a89f4937bf053ec1bb",
        "sources": sourceId,
      },
    );
    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }

  @override
  Future<SourseResponse> getSources({String? id, String? query}) async {
    Uri url = Uri.https("newsapi.org", "v2/top-headlines/sources", {
      "apiKey": "d1ed2239dec843a89f4937bf053ec1bb",
      "category": id,
      "q": query
    });
    http.Response response = await http.get(url);
    Map<String, dynamic> jsonFormat = jsonDecode(response.body);
    SourseResponse sourseResponse = SourseResponse.fromJson(jsonFormat);
    return sourseResponse;
  }
}

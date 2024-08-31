import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/sourse_response_model.dart';

class ApiManager {
  //  https://newsapi.org/v2/top-headlines/sources?apiKey=d1ed2239dec843a89f4937bf053ec1bb
  // static Future<SourseResponse> getSourses(String id) async {

  // }

  static Future<NewsDataResponse> getNewsData(String sourceId) async {
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=d1ed2239dec843a89f4937bf053ec1bb
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {"apiKey": "d1ed2239dec843a89f4937bf053ec1bb", "sources": sourceId},
    );
    http.Response response = await http.get(url);
    var jsonFormat = jsonDecode(response.body);
    NewsDataResponse newsDataResponse = NewsDataResponse.fromJson(jsonFormat);
    return newsDataResponse;
  }
}

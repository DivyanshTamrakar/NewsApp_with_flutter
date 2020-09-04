import 'dart:convert';
import 'package:newsapp_with_flutter/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=c2efe4eab6df4105b9821d1d1279384f";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              element['author'],
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['content'],
              element['publishedAt']);
          news.add(articleModel);
        }
      });
    } else {}

    //print(response);
  }
}

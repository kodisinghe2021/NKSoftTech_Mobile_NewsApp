import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:reading_application_app/models/article.dart';

class ApiConnect {
  final newsURL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=03a03e766dcc4d75a0ece81ad05a00a2";

  Future<List<Article>> getNews() async {
    Response response = await http.get(Uri.parse(newsURL));

    List<Article> articles = [];
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    } else {
      print("Error for response");
    }
    return articles;
  }
}

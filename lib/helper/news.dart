import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hw1/models/article.dart';

// import 'package:hw1/secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=apple&from=2024-02-11&to=2024-02-11&sortBy=popularity&apiKey=d072211f628249d0960d277c69f480a6';

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          news.add(article);
        }
      });
    }
  }
}

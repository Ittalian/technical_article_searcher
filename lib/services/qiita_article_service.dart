import 'dart:convert';

import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:http/http.dart' as http;

class QiitaArticleService {
  final String keyWord;
  final String tag;

  const QiitaArticleService({
    required this.keyWord,
    required this.tag,
  });

  Future<List<QiitaArticle>> getArticles() async {
    List<QiitaArticle> articles = [];
    String requestUrl = 'https://qiita.com//api/v2/items?page=1&query=body:$keyWord';
    if (tag != '') {
      requestUrl += ' tag:$tag';
    }

    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final resJson = json.decode(response.body);
        for (var res in resJson) {
          articles.add(QiitaArticle(
              title: res['title'],
              url: res['url'],
              createdAt: res['created_at'],
              updatedAt: res['updated_at']));
        }
      }
    } catch (e) {
      print('エラーです\n');
      print(e);
    }

    return articles;
  }
}

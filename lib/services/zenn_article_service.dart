import 'dart:convert';

import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:http/http.dart' as http;

class ZennArticleService {
  final String keyWord;

  const ZennArticleService({
    required this.keyWord,
  });

  Future<List<ZennArticle>> getArticles(int page) async {
    List<ZennArticle> articles = [];
    String requestUrl = 'https://zenn.dev/api/articles?page=$page';

    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final resJson = json.decode(response.body);
        final data = resJson['articles'];
        final nextPage = resJson['next_page'];
        for (var res in data) {
          if (_filterByKeyWord(res['title'])) {
            articles.add(ZennArticle(
              title: res['title'],
              url: 'https://zenn.dev${res['path']}',
              publishedAt: _formatDate(res['published_at']),
              bodyUpdatedAt: _formatDate(res['body_updated_at']),
              nextPage: nextPage,
            ));
          }
        }
      }
    } catch (e) {
      print('エラーです\n');
      print(e);
    }

    return articles;
  }

  bool _filterByKeyWord(String name) {
    if (name.toLowerCase().contains(keyWord.toLowerCase())) {
      return true;
    }
    return false;
  }

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.year}年${dateTime.month.toString().padLeft(2, '0')}月${dateTime.day.toString().padLeft(2, '0')}日';
  }
}

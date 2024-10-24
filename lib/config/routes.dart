import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/views/result/result.dart';

class Routes {
  static const String result = 'result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case result:
        final resultOptions = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (_) => Result(
            qiitaArticles: resultOptions['qiita_articles'] as List<QiitaArticle>,
            zennArticles: resultOptions['zenn_articles'] as List<ZennArticle>,
            keyWord: resultOptions['key_word'] as String,
            tag: resultOptions['tag'] as String,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                '${settings.name}は存在しません',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
        );
    }
  }
}

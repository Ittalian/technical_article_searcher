import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/views/result/qiita/qiita_result.dart';
import 'package:technical_article_searcher/views/result/zenn/zenn_result.dart';

class Result extends StatefulWidget {
  final List<QiitaArticle> qiitaArticles;
  final List<ZennArticle> zennArticles;

  const Result({
    super.key,
    required this.qiitaArticles,
    required this.zennArticles,
  });

  @override
  State<Result> createState() => ResultState();
}

class ResultState extends State<Result> {
  List<Widget> pages = [];

  @override
  initState() {
    super.initState();
    buildPage();
  }

  buildPage() {
    setState(() {
      if (widget.qiitaArticles.isNotEmpty) {
        pages.add(QiitaResult(articles: widget.qiitaArticles));
      }
      if (widget.zennArticles.isNotEmpty) {
        pages.add(ZennResult(articles: widget.zennArticles));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
      )
    );
  }
}

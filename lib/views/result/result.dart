import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/views/result/qiita/qiita_result.dart';
import 'package:technical_article_searcher/views/result/zenn/zenn_result.dart';

class Result extends StatefulWidget {
  final List<QiitaArticle> qiitaArticles;
  final List<ZennArticle> zennArticles;
  final String keyWord;
  final String tag;

  const Result({
    super.key,
    required this.qiitaArticles,
    required this.zennArticles,
    required this.keyWord,
    required this.tag,
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
        pages.add(QiitaResult(
          articles: widget.qiitaArticles,
          keyWord: widget.keyWord,
          tag: widget.tag,
        ));
      }
      if (widget.zennArticles.isNotEmpty) {
        pages.add(ZennResult(
          articles: widget.zennArticles,
          keyWord: widget.keyWord,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: pages,
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/article.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/result/resullt_tile.dart';

class Result extends StatelessWidget {
  final List<Article> articles;

  const Result({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/result_qiita_background.jpg',
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var article in articles)
                ResulltTile(article: article)
            ],
          ),
        ),
      )
    );
  }
}

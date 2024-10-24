import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/result/resullt_tile.dart';

class QiitaResult extends StatelessWidget {
  final List<QiitaArticle> articles;

  const QiitaResult({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/result_qiita_background.jpg',
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var article in articles) ResulltTile(qiitaArticle: article)
            ],
          ),
        ),
      ),
    );
  }
}

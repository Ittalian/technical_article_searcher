import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/result/resullt_tile.dart';

class ZennResult extends StatelessWidget {
  final List<ZennArticle> articles;

  const ZennResult({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
      imagePath: 'images/result_zenn_background.jpg',
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var article in articles) ResulltTile(zennArticle: article)
            ],
          ),
        ),
      ),
    );
  }
}

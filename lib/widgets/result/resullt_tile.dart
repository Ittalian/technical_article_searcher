import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/article.dart';
import 'package:technical_article_searcher/widgets/base/base_text_button.dart';
import 'package:technical_article_searcher/widgets/result/result_text_row.dart';
import 'package:url_launcher/url_launcher.dart';

class ResulltTile extends StatelessWidget {
  final Article article;

  const ResulltTile({super.key, required this.article});

  void renderUrl() {
    final url = Uri.parse(article.url);
    launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseTextButton(onPressed: renderUrl, label: article.title),
        ResultTextRow(label: '作成日', value: article.createdAt),
        ResultTextRow(label: '更新日', value: article.updatedAt),
      ],
    );
  }
}

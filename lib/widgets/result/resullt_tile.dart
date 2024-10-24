import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/widgets/base/base_text_button.dart';
import 'package:technical_article_searcher/widgets/result/result_text_row.dart';
import 'package:url_launcher/url_launcher.dart';

class ResulltTile extends StatelessWidget {
  final QiitaArticle? qiitaArticle;
  final ZennArticle? zennArticle;

  const ResulltTile({
    super.key,
    this.qiitaArticle,
    this.zennArticle,
  });

  void renderUrl() {
    Uri url;
    if (zennArticle == null) {
      url = Uri.parse(qiitaArticle!.url);
    } else {
      url = Uri.parse(zennArticle!.url);
    }
    launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color:
        zennArticle == null
        ?
        Colors.green.withOpacity(0.5)
        :
        Colors.blue.withOpacity(0.5),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            zennArticle == null
                ? BaseTextButton(
                    onPressed: renderUrl,
                    label: qiitaArticle!.title,
                    color: Colors.black,
                  )
                : BaseTextButton(
                    onPressed: renderUrl,
                    label: zennArticle!.title,
                    color: Colors.black,
                  ),
            zennArticle == null
                ? ResultTextRow(label: '作成日 ', value: qiitaArticle!.createdAt)
                : ResultTextRow(label: '作成日 ', value: zennArticle!.publishedAt),
            zennArticle == null
                ? ResultTextRow(label: '更新日 ', value: qiitaArticle!.updatedAt)
                : ResultTextRow(
                    label: '更新日 ', value: zennArticle!.bodyUpdatedAt),
          ],
        ));
  }
}

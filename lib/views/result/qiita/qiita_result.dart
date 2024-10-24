import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/services/qiita_article_service.dart';
import 'package:technical_article_searcher/utils/loading/loading_dialog.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/base/base_text_button.dart';
import 'package:technical_article_searcher/widgets/result/resullt_tile.dart';
import '../../../utils/constants/message_constants.dart' as messages;

class QiitaResult extends StatefulWidget {
  final List<QiitaArticle> articles;
  final String keyWord;
  final String tag;

  const QiitaResult({
    super.key,
    required this.articles,
    required this.keyWord,
    required this.tag,
  });

  @override
  State<QiitaResult> createState() => QiitaResultState();
}

class QiitaResultState extends State<QiitaResult> {
  Future<void> moreSearch(BuildContext context) async {
    List<QiitaArticle> articles =
        await QiitaArticleService(keyWord: widget.keyWord, tag: widget.tag)
            .getArticles(widget.articles.last.nextPage);
    setState(() {
      widget.articles.addAll(articles);
    });
  }

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
              for (var article in widget.articles)
                ResulltTile(qiitaArticle: article),
              BaseTextButton(
                onPressed: () async {
                  await LoadingDialog.show(context, messages.loading);
                  await moreSearch(context);
                  await LoadingDialog.hide(context);
                },
                label: 'もっと表示する',
                color: Colors.green[900]!,
              )
            ],
          ),
        ),
      ),
    );
  }
}

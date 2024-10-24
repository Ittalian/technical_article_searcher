import 'package:flutter/material.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/services/zenn_article_service.dart';
import 'package:technical_article_searcher/utils/loading/loading_dialog.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/base/base_text_button.dart';
import 'package:technical_article_searcher/widgets/result/resullt_tile.dart';
import '../../../utils/constants/message_constants.dart' as messages;

class ZennResult extends StatefulWidget {
  final List<ZennArticle> articles;
  final String keyWord;

  const ZennResult({
    super.key,
    required this.articles,
    required this.keyWord,
  });

  @override
  State<ZennResult> createState() => ZennResultState();
}

class ZennResultState extends State<ZennResult> {
  
  Future<void> moreSearch(BuildContext context) async {
    List<ZennArticle> articles =
        await ZennArticleService(keyWord: widget.keyWord)
            .getArticles(widget.articles.last.nextPage);
    setState(() {
      widget.articles.addAll(articles);
    });
  }

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
              for (var article in widget.articles)
                ResulltTile(zennArticle: article),
              BaseTextButton(
                onPressed: () async {
                  await LoadingDialog.show(context, messages.loading);
                  await moreSearch(context);
                  await LoadingDialog.hide(context);
                },
                label: 'もっと表示する',
                color: Colors.blue[900]!,
              )
            ],
          ),
        ),
      ),
    );
  }
}

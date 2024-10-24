import 'package:flutter/material.dart';
import 'package:technical_article_searcher/config/routes.dart';
import 'package:technical_article_searcher/models/qiita_article.dart';
import 'package:technical_article_searcher/models/tag.dart';
import 'package:technical_article_searcher/models/zenn_article.dart';
import 'package:technical_article_searcher/services/qiita_article_service.dart';
import 'package:technical_article_searcher/services/tag_service.dart';
import 'package:technical_article_searcher/services/zenn_article_service.dart';
import 'package:technical_article_searcher/utils/loading/loading_dialog.dart';
import 'package:technical_article_searcher/widgets/base/base_button.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/base/base_select.dart';
import 'package:technical_article_searcher/widgets/base/base_textfield.dart';
import '../../utils/constants/message_constants.dart' as messages;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  String keyWord = '';
  List<String> tags = [];
  String tag = '';
  String site = '';
  List<String> siteOption = ['両方', 'qiita', 'zenn'];

  @override
  initState() {
    super.initState();
    setAllTags();
  }

  Future<void> setAllTags() async {
    List<String> tagList = await getAllTags();
    setState(() {
      tags = tagList;
    });
  }

  Future<List<String>> getAllTags() async {
    List<String> tagList = [];
    List<Tag> tags = await const TagService().getAllTags();
    for (var tag in tags) {
      tagList.add(tag.name);
    }

    return tagList;
  }

  void setKeyWord(String value) {
    setState(() {
      keyWord = value;
    });
  }

  void setTag(String value) {
    setState(() {
      tag = value;
    });
  }

  void setSite(String value) {
    setState(() {
      site = value;
    });
  }

  Future<List<QiitaArticle>> searchQiita() async {
    return await QiitaArticleService(keyWord: keyWord, tag: tag).getArticles(1);
  }

  Future<List<ZennArticle>> searchZenn() async {
    return await ZennArticleService(keyWord: keyWord).getArticles(1);
  }

  void moveResultPage(BuildContext context, List<QiitaArticle> qiitaArticles,
      List<ZennArticle> zennArticles) {
    Navigator.pushNamed(
      context,
      Routes.result,
      arguments: {
        'qiita_articles': qiitaArticles,
        'zenn_articles': zennArticles,
        'key_word': keyWord,
        'tag': tag,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/search_background.jpg',
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BaseTextformField(
                  label: 'キーワード', setValue: (value) => setKeyWord(value)),
              BaseSelect(
                  option: tags,
                  hintText: 'タグ',
                  onSelected: (value) => setTag(value)),
              BaseSelect(
                option: siteOption,
                hintText: '媒体',
                onSelected: (value) => setSite(value),
                initText: '両方',
              ),
              BaseButton(
                  label: '検索',
                  onPressed: () async {
                    List<QiitaArticle> qiitaArticles = [];
                    List<ZennArticle> zennArticles = [];
                    await LoadingDialog.show(context, messages.loading);
                    if (site != 'zenn') {
                      qiitaArticles = await searchQiita();
                    }
                    if (site != 'qiita') {
                      zennArticles = await searchZenn();
                    }
                    await LoadingDialog.hide(context);
                    moveResultPage(context, qiitaArticles, zennArticles);
                  }),
            ],
          ),
        ));
  }
}

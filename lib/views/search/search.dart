import 'package:flutter/material.dart';
import 'package:technical_article_searcher/config/routes.dart';
import 'package:technical_article_searcher/models/article.dart';
import 'package:technical_article_searcher/models/tag.dart';
import 'package:technical_article_searcher/services/article_service.dart';
import 'package:technical_article_searcher/services/tag_service.dart';
import 'package:technical_article_searcher/widgets/base/base_button.dart';
import 'package:technical_article_searcher/widgets/base/base_image_container.dart';
import 'package:technical_article_searcher/widgets/base/base_select.dart';
import 'package:technical_article_searcher/widgets/base/base_textfield.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  String keyWord = '';
  List<String> tags = [];
  String tag = '';

  @override
  initState() {
    super.initState();
    setAllTags();
  }

  Future<void> setAllTags() async {
    tags = await getAllTags();
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

  Future<List<Article>> search() async {
    return await ArticleService(keyWord: keyWord, tag: tag)
        .getArticles(keyWord, tag);
  }

  void moveResultPage(BuildContext context, List<Article> articles) {
    Navigator.pushNamed(
      context,
      Routes.result,
      arguments: {'articles': articles},
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
              BaseButton(
                  label: '検索',
                  onPressed: () async {
                    List<Article> articles = await search();
                    moveResultPage(context, articles);
                  }),
            ],
          ),
        ));
  }
}

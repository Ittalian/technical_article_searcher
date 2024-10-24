import 'dart:convert';

import 'package:technical_article_searcher/models/tag.dart';
import 'package:http/http.dart' as http;

class TagService {
  const TagService();

  Future<List<Tag>> getAllTags() async {
    List<Tag> tags = [];
    String requestUrl = 'https://qiita.com/api/v2/tags?sort=count';

    try {
      final response = await http.get(Uri.parse(requestUrl));
      if (response.statusCode == 200) {
        final resJson = json.decode(response.body);
        for (var res in resJson) {
          tags.add(Tag(name: res['id']));
        }
      }
    } catch (e) {
      print('エラーです\n');
      print(e);
    }

    return tags;
  }
}

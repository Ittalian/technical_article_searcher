import 'package:flutter/material.dart';
import 'package:technical_article_searcher/config/routes.dart';
import 'package:technical_article_searcher/views/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Search(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

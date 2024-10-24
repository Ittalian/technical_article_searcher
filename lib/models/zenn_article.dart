class ZennArticle {
  final String title;
  final String url;
  final String publishedAt;
  final String bodyUpdatedAt;
  final int nextPage;

  const ZennArticle({
    required this.title,
    required this.url,
    required this.publishedAt,
    required this.bodyUpdatedAt,
    required this.nextPage,
  });
}

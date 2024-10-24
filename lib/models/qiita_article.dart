class QiitaArticle {
  final String title;
  final String url;
  final String createdAt;
  final String updatedAt;
  final int nextPage;

  const QiitaArticle({
    required this.title,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.nextPage,
  });
}

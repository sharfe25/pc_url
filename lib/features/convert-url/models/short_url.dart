class ShortUrl {
  ShortUrl({
    this.resultURL,
  });

  factory ShortUrl.fromMap(Map<String, dynamic> json) {
    return ShortUrl(
      resultURL: json['result_url'] as String?,
    );
  }

  final String? resultURL;
}
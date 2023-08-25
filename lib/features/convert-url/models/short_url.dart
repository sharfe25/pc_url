class ShortUrl {
  /// class instance
  ShortUrl({
    this.resultURL,
  });

  /// Map deserialization of this object.
  factory ShortUrl.fromMap(Map<String, dynamic> json) {
    return ShortUrl(
      resultURL: json['result_url'] as String?,
    );
  }

  final String? resultURL;
}
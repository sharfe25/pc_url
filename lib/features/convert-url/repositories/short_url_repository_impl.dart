import 'dart:convert';

import 'package:pc_url/core/configs/database/database_helper.dart';
import 'package:pc_url/environment.dart';
import 'package:pc_url/features/convert-url/models/short_url.dart';
import 'package:pc_url/features/convert-url/repositories/short_url_repository.dart';
import 'package:http/http.dart' as http;

class ShortUrlRepositoryImpl extends ShortUrlRepository {
  final http.Client _httpClient;
  /// Default constructor for [ShortUrlRepositoryImpl] object.
  ShortUrlRepositoryImpl({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();
  

  @override
  Future<ShortUrl> getShortUrl(String longUrl) async {
    var url = Uri.parse("${Environment.apiUrl}shorten");
    final res = await _httpClient.post(
      url,
      body: {'url': longUrl},
    );
    if (res.statusCode == 200) {
      final jsonUrl = json.decode(res.body);
      ShortUrl shortUrl = ShortUrl.fromMap(jsonUrl);
      await DatabaseHelper.insertUrl(jsonUrl);
      return shortUrl;
    } else {
      return ShortUrl();
    }
  }
}

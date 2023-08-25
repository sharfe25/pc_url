import 'package:pc_url/features/convert-url/models/short_url.dart';

abstract class ShortUrlRepository {
  Future<ShortUrl> getShortUrl(String longUrl);
}

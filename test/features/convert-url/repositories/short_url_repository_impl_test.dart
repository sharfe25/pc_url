import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:pc_url/environment.dart';
import 'package:pc_url/features/convert-url/models/short_url.dart';
import 'package:pc_url/features/convert-url/repositories/short_url_repository_impl.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockClient extends Mock implements http.Client {}

void main() async {
  await dotenv.load(fileName: ".env.development");

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  group('ShortUrlRepositoryImpl', () {
    late MockClient mockClient;
    late ShortUrlRepositoryImpl repository;
    

    setUp(() {
      repository = ShortUrlRepositoryImpl();
      mockClient = MockClient();
    });

    test('getShortUrl returns a ShortUrl object on success',
        () async {
      when(() => mockClient.post(
          Uri.parse("${Environment.apiUrl}shorten"),
          body: {"url": "https://pub.dev/packages/mocktail"})).thenAnswer((_) async => http.Response('{"result_url": "https://shortened-url.com"}', 200));

      final res = await repository.getShortUrl("https://pub.dev/packages/mocktail");
      expect(res, isA<ShortUrl>());
      expect(res.resultURL, contains('https://cleanuri.com/'));
    });
  });
}

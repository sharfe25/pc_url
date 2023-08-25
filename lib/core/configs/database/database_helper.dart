import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const String _dbName = 'pc_url.db';
  static const int _version = 1;

  static Future<Database> _getDB() async {
    
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: (db, version) async => await db.execute(
            '''
      CREATE TABLE urls (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        result_url TEXT
      );
    '''),
        version: _version);
  }

  static Future<int> insertUrl(Map<String, dynamic> url) async {
    final db = await _getDB();
    return await db.insert("urls", url);
  }

  static Future<List<Map<String, dynamic>>> getAllUrls() async {
    final db = await _getDB();
    return await db.query("urls");
  }
}

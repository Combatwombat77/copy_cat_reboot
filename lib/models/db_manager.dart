import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvas.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table customer_segments(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getCustSegList() async {
    if (db == null) {
      await open();
    }
    return await db.query('customer_segments');
  }

  static Future insertCustSegNote(Map<String, dynamic> note) async {
    await db.insert('customer_segments', note);
  }

  static Future updateNote(Map<String, dynamic> note) async {
    await db.update(
      'customer_segments',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteNote(int id) async {
    await db.delete(
      'customer_segments',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}
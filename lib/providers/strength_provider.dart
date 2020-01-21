import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class StrengthProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'Strengths.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Strengths(
            id integer primary key autoincrement,
            title text not null,
            text text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getStrengthList() async {
    if (db == null) {
      await open();
    }
    return await db.query('Strengths');
  }

  static Future insertNote(Map<String, dynamic> note) async {
    await db.insert('Strengths', note);
  }

  static Future updateNote(Map<String, dynamic> note) async {
    await db.update(
      'Strengths',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteNote(int id) async {
    await db.delete(
      'Strengths',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}
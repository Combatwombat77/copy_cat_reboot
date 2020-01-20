import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'weaknesses.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Weaknesses(
            id integer primary key autoincrement,
            title text not null,
            text text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getNoteList() async {
    if (db == null) {
      await open();
    }
    return await db.query('Weaknesses');
  }

  static Future insertNote(Map<String, dynamic> note) async {
    await db.insert('Weaknesses', note);
  }

  static Future updateNote(Map<String, dynamic> note) async {
    await db.update(
      'Weaknesses',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteNote(int id) async {
    await db.delete(
      'Weaknesses',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}
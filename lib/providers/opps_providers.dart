import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OppsProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'opportunities.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Opps(
            id integer primary key autoincrement,
            title text not null,
            text text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getOppsList() async {
    if (db == null) {
      await open();
    }
    return await db.query('Opps');
  }

  static Future insertOpps(Map<String, dynamic> note) async {
    await db.insert('Opps', note);
  }

  static Future updateOpps(Map<String, dynamic> note) async {
    await db.update(
      'Opps',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteOpps(int id) async {
    await db.delete(
      'Opps',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}
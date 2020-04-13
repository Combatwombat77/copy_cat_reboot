import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DBManagerSwotPics {
  static Database db;
  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'canvasAppModel.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table swotImages(
            id integer primary key autoincrement,
            imageTitle text not null,
          );''');
    });
  }

  static Future insertModel(Map<String, dynamic> note) async {
    await db.insert('swotImages', note);
  }

  static Future deleteModel(int id) async {
    await db.delete('swotImages', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update('swotImages', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('swotImages');
    }
  }

}
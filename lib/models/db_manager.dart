import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerViews {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvasAppK.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table customer_segments(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table value_propositions(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID integer not null
          );''');
        await db.execute('''
          create table channels(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table revenue_stream(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table customer_relationships(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table key_resources(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table key_activities(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table key_partners(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
          await db.execute('''
          create table cost_structure(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
      }
    );
  }


  static Future<List> getCustSeg(String modelID) async {
  List<Map> results = await db.query("customer_segments",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


  if (results.length > 0) {
    return results;
  }
  return null;
}

  static Future<List> getLists(String tableName, int modelID) async {
    if (db == null) {
      await openDB();
    }else{
    if(tableName == "Customer Segments") {
      List<Map> results = await db.query("customer_segments",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Value Propositions") {
      List<Map> results = await db.query("value_propositions",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Channels") {
      List<Map> results = await db.query("channels",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Customer Relationships") {
      List<Map> results = await db.query("customer_relationships",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName =="Revenue Streams") {
      List<Map> results = await db.query("revenue_stream",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Key Resources") {
      List<Map> results = await db.query("key_resources",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Key Activities") {
      List<Map> results = await db.query("key_activities",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Key Partners") {
      List<Map> results = await db.query("key_partners",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Cost Structure") {
      List<Map> results = await db.query("cost_structure",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }

    }
  }


  static Future insertCustSegNote(Map<String, dynamic> note, String tableName) async {
    if(tableName == "Customer Segments") {
      await db.insert('customer_segments', note);
    }else if(tableName == "Value Propositions") {
      await db.insert('value_propositions', note);
    }else if(tableName == "Channels") {
      await db.insert('channels', note);
    }else if(tableName == "Customer Relationships") {
      await db.insert('customer_relationships', note);
    }else if(tableName =="Revenue Streams") {
      await db.insert('revenue_stream', note);
    }else if(tableName == "Key Resources") {
      await db.insert('key_resources', note);
    }else if(tableName == "Key Activities") {
      await db.insert('key_activities', note);
    }else if(tableName == "Key Partners") {
      await db.insert('key_partners', note);
    }else if(tableName == "Cost Structure") {
      await db.insert('cost_structure', note);
    }
    
  }

  static Future updateCustSegNote(Map<String, dynamic> note) async {
    await db.update(
      'customer_segments',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteCustSegNote(int id) async {
    await db.delete(
      'customer_segments',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future deleteValPropNote(int id) async {
    await db.delete(
        'value_propositions',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteChannelNote(int id) async {
    await db.delete(
        'channel',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteRevStreamNote(int id) async {
    await db.delete(
        'revenue_stream',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteKeyResNote(int id) async {
    await db.delete(
        'key_resources',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteKeyActNote(int id) async {
    await db.delete(
        'key_activities',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteKeyPartNote(int id) async {
    await db.delete(
        'key_partners',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteCostStructNote(int id) async {
    await db.delete(
        'cost_structure',
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future deleteCustRelNote(int id) async {
    await db.delete(
        'customer_relationships',
        where: 'id = ?',
        whereArgs: [id]);
  }
}


class DBManagerModel{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvasAppModel.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table models(
            id integer primary key autoincrement,
            ModelTitle text not null,
            ModelDescription text not null,
            For text not null,
            By text not null
          );''');
      });
      }

       static Future insertModel(Map<String, dynamic> note) async {
    await db.insert('models', note);
  }

  static Future deleteModel(int id) async {
    await db.delete(
      'models',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update(
        'models',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('models');
    }

   }

  //  static Future<List<Map<String, dynamic>>> getId(String title) async {
  //   if (db == null) {
  //     await openDB();
  //   }else{
  //     // return await db.query('models');
  //     String test = db.rawQuery('SELECT `id` FROM `models` WHERE `ModelTitle` = "Test Title"');
  //     return await 
  //   }

  //  }

}  



class DBManagerSwot{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvasAppSwot.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table swot(
            id integer primary key autoincrement,
            SwotTitle text not null,
            SwotDescription text not null
          );''');
      });
      }

       static Future insertModel(Map<String, dynamic> note) async {
    await db.insert('swot', note);
  }

  static Future deleteModel(int id) async {
    await db.delete(
      'swot',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update(
        'swot',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('swot');
    }

   }

}  


class Note {
  int id;
  String title;
  String description;
  String modelID;

  Note({this.id, this.title, this.description, this.modelID});

    // int get id => id;
    // String get title => title;
    // String get description => description;
    // String get modelID => modelID;


    factory Note.fromMap(Map<String, dynamic> data) => new Note(
        id: data["id"],
        title: data["title"],
        description: data["description"],
        modelID: data["modelID"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "Ttitle": title,
        "description": description,
        "modelID": modelID,
    };


}
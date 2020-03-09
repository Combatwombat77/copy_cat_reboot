import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
        String path = join(documentsDirectory.path, "main.db");
        var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
        return theDb;
      }
    
      void _onCreate(Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            "CREATE TABLE Value(id INTEGER PRIMARY KEY, firstname TEXT, )");
      }
    
      Future<int> saveValue(Value value) async {
        var dbClient = await db;
        int res = await dbClient.insert("Value", value.toMap());
        return res;
      }
    
      Future<List<Value>> getValue() async {
        var dbClient = await db;
        List<Map> list = await dbClient.rawQuery('SELECT * FROM Value');
        List<Value> employees = new List();
        for (int i = 0; i < list.length; i++) {
          var value =
              new Value(list[i]["firstname"]);
          value.setValueId(list[i]["id"]);
          employees.add(value);
        }
        print(employees.length);
        return employees;
      }
    
      Future<int> deleteUsers(Value value) async {
        var dbClient = await db;
    
        int res =
            await dbClient.rawDelete('DELETE FROM User WHERE id = ?', [value.id]);
        return res;
      }
    
      Future<bool> update(Value value) async {
        var dbClient = await db;
        int res =   await dbClient.update("value", value.toMap(),
            where: "id = ?", whereArgs: <int>[value.id]);
        return res > 0 ? true : false;
      }
    }



    class Value {

  int id;
  String _firstName;


  Value(this._firstName);

  Value.map(dynamic obj) {
    this._firstName = obj["firstname"];

  }

  String get firstName => _firstName;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstname"] = _firstName;

    return map;
  }
  void setValueId(int id) {
    this.id = id;
  }
}
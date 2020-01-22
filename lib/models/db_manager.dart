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
        db.execute('''
          create table value_propositions(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table channels(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table revenue_stream(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table customer_relationships(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table key_resources(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table key_activities(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table key_partners(
            id integer primary key autoincrement,
            title text not null,
            description text not null
          );
        ''');

        db.execute('''
          create table cost_structure(
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

  static Future<List<Map<String, dynamic>>> getValPropsList() async {
    if (db == null) {
      await open();
    }
    return await db.query('value_propositions');
  }

  static Future<List<Map<String, dynamic>>> getChannelList() async {
    if (db == null) {
      await open();
    }
    return await db.query('channels');
  }

  static Future<List<Map<String, dynamic>>> getCustRelList() async {
    if (db == null) {
      await open();
    }
    return await db.query('customer_relationships');
  }

  static Future<List<Map<String, dynamic>>> getRevStreamList() async {
    if (db == null) {
      await open();
    }
    return await db.query('revenue_stream');
  }

  static Future<List<Map<String, dynamic>>> getKeyResList() async {
    if (db == null) {
      await open();
    }
    return await db.query('key_resources');
  }

  static Future<List<Map<String, dynamic>>> getKeyActList() async {
    if (db == null) {
      await open();
    }
    return await db.query('key_activities');
  }

  static Future<List<Map<String, dynamic>>> getCostStructList() async {
    if (db == null) {
      await open();
    }
    return await db.query('cost_structure');
  }

  static Future<List<Map<String, dynamic>>> getKeyPartList() async {
    if (db == null) {
      await open();
    }
    return await db.query('key_partners');
  }

  static Future insertCustSegNote(Map<String, dynamic> note) async {
    await db.insert('customer_segments', note);
  }

  static Future insertValPropsNote(Map<String, dynamic> note) async {
    await db.insert('value_propositions', note);
  }

  static Future insertChannelsNote(Map<String, dynamic> note) async {
    await db.insert('channels', note);
  }

  static Future insertCustRelNote(Map<String, dynamic> note) async {
    await db.insert('customer_relationships', note);
  }

  static Future insertRevStreamNote(Map<String, dynamic> note) async {
    await db.insert('revenue_stream', note);
  }

  static Future insertKeyResNote(Map<String, dynamic> note) async {
    await db.insert('key_resources', note);
  }

  static Future insertKeyActNote(Map<String, dynamic> note) async {
    await db.insert('key_activities', note);
  }

  static Future insertKeyPartNote(Map<String, dynamic> note) async {
    await db.insert('key_partners', note);
  }

  static Future insertCostStructNote(Map<String, dynamic> note) async {
    await db.insert('cost_structure', note);
  }

  static Future updateCustSegNote(Map<String, dynamic> note) async {
    await db.update(
      'customer_segments',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future updateValPropNote(Map<String, dynamic> note) async {
    await db.update(
        'value_propositions',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateChannelNote(Map<String, dynamic> note) async {
    await db.update(
        'channels',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateCustRelNote(Map<String, dynamic> note) async {
    await db.update(
        'customer_relationships',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateRevStreamNote(Map<String, dynamic> note) async {
    await db.update(
        'revenue_stream',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateKeyResNote(Map<String, dynamic> note) async {
    await db.update(
        'key_resources',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateKeyActNote(Map<String, dynamic> note) async {
    await db.update(
        'key_activities',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateKeyPartNote(Map<String, dynamic> note) async {
    await db.update(
        'key_partners',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future updateCostStructNote(Map<String, dynamic> note) async {
    await db.update(
        'cost_structure',
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
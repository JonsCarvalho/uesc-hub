// import 'dart:io';

// import 'package:uesc_hub/app/modules/schedule/models/timetable_model.dart';
// import 'package:uesc_hub/app/shared/repositories/localstorage/local_storage_interface.dart';
// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class LocalStorageSqflite implements ILocalStorage {
//   Database _database;

//   _init() async {
//     final path = await getDatabasePath('uesc_hub_db');
//     _database = await openDatabase(path, version: 1, onCreate: onCreate);
//   }

//   LocalStorageSqflite() {
//     _init();
//   }

//   @override
//   Future delete(String key) async {}

//   @override
//   Future<List> get(String key) async {
//     final sql = '''SELECT * FROM $key''';
//     final data = await _database.rawQuery(sql);

//     if (key == 'credentials') {
//       List<String> credentials = List();

//       credentials.insert(0, data[0]['username']);
//       credentials.insert(1, data[0]['password']);

//       return credentials;
//     // } else if (key == 'timetable') {
//     } else{
//       List<TimetableModel> timetable = List();

//       for (final node in data) {
//         final instance = TimetableModel(
//           startTime: node['startTime'],
//           endTime: node['endTime'],
//           seg: node['seg'],
//           ter: node['ter'],
//           qua: node['qua'],
//           qui: node['qui'],
//           sex: node['sex'],
//           sab: node['sab'],
//           dom: node['dom'],
//         );
//         timetable.add(instance);
//       }
//       return timetable;
//     }
//   }

//   @override
//   Future put(String key, List list) async {
//     if (key == 'credentials') {
//       final sql = '''INSERT INTO $key
//     (
//       username,
//       password
//     )
//     VALUES (?,?)''';
//       List<dynamic> params = [list[0], list[1]];
//       await _database.rawInsert(sql, params);
//       // final result = await _database.rawInsert(sql, params);
//       // DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
//     } else if (key == 'timetable') {
//       final sql = '''INSERT INTO $key
//     (
//       startTime,
//       endTime,
//       seg,
//       ter,
//       qua,
//       qui,
//       sex,
//       sab,
//       dom
//     )
//     VALUES (?,?,?,?,?,?,?,?,?)''';
//       List<dynamic> params = [list];
//       final result = await _database.rawInsert(sql, params);
//       DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
//     }
//   }

//   Future<String> getDatabasePath(String dbName) async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, dbName);

//     if (await Directory(dirname(path)).exists()) {
//       //await deleteDatabase(path);
//     } else {
//       await Directory(dirname(path)).create(recursive: true);
//     }
//     return path;
//   }

//   Future<void> onCreate(Database db, int version) async {
//     await createTable(db, 'credentials');
//     await createTable(db, 'timetable');
//   }

//   Future<void> createTable(Database db, String table) async {
//     if (table == 'credentials') {
//       final comandSql = '''CREATE TABLE $table
//     (
//       username TEXT PRIMARY KEY,
//       password TEXT
//     )''';
//       await db.execute(comandSql);
//     } else if (table == 'timetable') {
//       final comandSql = '''CREATE TABLE $table
//     (
//       startTime TEXT PRIMARY KEY,
//       endTime TEXT,
//       seg TEXT,
//       ter TEXT,
//       qua TEXT,
//       qui TEXT,
//       sex TEXT,
//       sab TEXT,
//       dom TEXT
//     )''';
//       await db.execute(comandSql);
//     }
//   }
// }

// class DatabaseCreator {
//   static void databaseLog(String functionName, String sql,
//       [List<Map<String, dynamic>> selectQueryResult,
//       int insertAndUpdateQueryResult,
//       List<dynamic> params]) {
//     print(functionName);
//     print(sql);
//     if (params != null) {
//       print(params);
//     }
//     if (selectQueryResult != null) {
//       print(selectQueryResult);
//     } else if (insertAndUpdateQueryResult != null) {
//       print(insertAndUpdateQueryResult);
//     }
//   }
// }

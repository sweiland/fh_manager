import 'dart:io';

import 'package:FH_Manager/model/subject_model.dart';
import 'package:FH_Manager/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;

  DBProvider._();

  static final DBProvider db = DBProvider._();

  var todos = [
    Task(
      'Course Becker',
      parent: '1',
      isCompleted: 1,
    ),
    Task(
      "Course Zeya",
      parent: '1',
    ),
    Task(
      "Course Reitbauer",
      parent: '1',
    ),
    Task(
      "OPMGT Abschlussübung",
      parent: '2',
    )
  ];

  var tasks = [
    Subject('WF-ENG',
        id: '1',
        color: Colors.blueGrey.value,
        codePoint: Icons.computer.codePoint),
    Subject('OPMGT',
        id: '2',
        color: Colors.deepOrange.value,
        codePoint: Icons.business_center.codePoint),
  ];

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  get _dbPath async {
    String documentsDirectory = await _localPath;
    return p.join(documentsDirectory, "Todo.db");
  }

  Future<bool> dbExists() async {
    return File(await _dbPath).exists();
  }

  initDB() async {
    String path = await _dbPath;
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      print("DBProvider:: onCreate()");
      await db.execute("CREATE TABLE Subject ("
          "id TEXT PRIMARY KEY,"
          "name TEXT,"
          "color INTEGER,"
          "code_point INTEGER"
          ")");
      await db.execute("CREATE TABLE Task ("
          "id TEXT PRIMARY KEY,"
          "name TEXT,"
          "parent TEXT,"
          "completed INTEGER NOT NULL DEFAULT 0,"
          "description TEXT,"
          "dueDate TEXT"
          ")");
    });
  }

  insertBulkTask(List<Subject> tasks) async {
    final db = await database;
    tasks.forEach((it) async {
      var res = await db.insert("Subject", it.toJson());
      print("Task ${it.id} = $res");
    });
  }

  insertBulkTodo(List<Task> todos) async {
    final db = await database;
    todos.forEach((it) async {
      var res = await db.insert("Task", it.toJson());
      print("Todo ${it.id} = $res");
    });
  }

  Future<List<Subject>> getAllTask() async {
    final db = await database;
    var result = await db.query('Subject');
    return result.map((it) => Subject.fromJson(it)).toList();
  }

  Future<List<Task>> getAllTodo() async {
    final db = await database;
    var result = await db.query('Task');
    return result.map((it) => Task.fromJson(it)).toList();
  }

  Future<int> updateTodo(Task todo) async {
    final db = await database;
    return db
        .update('Task', todo.toJson(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> removeTodo(Task todo) async {
    final db = await database;
    return db.delete('Task', where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> insertTodo(Task todo) async {
    final db = await database;
    return db.insert('Task', todo.toJson());
  }

  Future<int> insertTask(Subject task) async {
    final db = await database;
    return db.insert('Subject', task.toJson());
  }

  Future<void> removeTask(Subject task) async {
    final db = await database;
    return db.transaction<void>((txn) async {
      await txn.delete('Task', where: 'parent = ?', whereArgs: [task.id]);
      await txn.delete('Subject', where: 'id = ?', whereArgs: [task.id]);
    });
  }

  Future<int> updateTask(Subject task) async {
    final db = await database;
    return db.update('Subject', task.toJson(),
        where: 'id = ?', whereArgs: [task.id]);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  closeDB() {
    if (_database != null) {
      _database.close();
    }
  }
}

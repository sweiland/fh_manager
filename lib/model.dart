import 'package:flutter/cupertino.dart' as prefix0;
import 'package:moor_flutter/moor_flutter.dart';

part 'model.g.dart';

class Task extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  RealColumn get importance => real()();

  DateTimeColumn get duedate => dateTime().withDefault(currentDateAndTime)();

  IntColumn get subject =>
      integer().customConstraint('REFERENCES subject(id)')();
}

class Subject extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  BoolColumn get enrolled => boolean()();
}

@UseMoor(tables: [Subject, Task], daos: [TaskDao, SubjectDao])
class DataBase extends _$DataBase {
  DataBase()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'fhmanager.sqlite'));

  @override
  int get schemaVersion => 3;
}

@UseDao(tables: [Task])
class TaskDao extends DatabaseAccessor<DataBase> with _$TaskDaoMixin {
  TaskDao(DataBase db) : super(db);

  Future<List<TaskData>> get allTasks => select(task).get();

  Stream<List<TaskData>> get watchAllTasks => select(task).watch();

  Future createTask(TaskCompanion taskData) {
    return into(task).insert(taskData);
  }
}

@UseDao(tables: [Subject])
class SubjectDao extends DatabaseAccessor<DataBase> with _$SubjectDaoMixin {
  SubjectDao(DataBase db) : super(db);

  Future<List<SubjectData>> get allSubjects => select(subject).get();

  Stream<List<SubjectData>> get watchAllSubjects => select(subject).watch();
}

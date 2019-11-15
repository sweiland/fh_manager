import 'package:moor_flutter/moor_flutter.dart';

part 'model.g.dart';

class Task extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get description => text().nullable()();

  RealColumn get importance => real()();

  DateTimeColumn get duedate => dateTime().withDefault(currentDateAndTime)();
}

class Color extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get hexCode => text().withLength(max: 6)();
}

class Subject extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  BoolColumn get enrolled => boolean()();

  RealColumn get ects => real()();
}

class Teacher extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get firstname => text()();

  TextColumn get lastname => text()();

  TextColumn get email => text()();
}

class SubjectWithTasksTeachersAndColor {
  final Subject subject;
  final List<Teacher> teachers;
  final List<Task> tasks;
  final Color color;

  SubjectWithTasksTeachersAndColor(this.subject, this.teachers, this.tasks,
      this.color);
}

@UseMoor(tables: [Subject, Task, Color, Teacher])
class DataBase extends _$DataBase {
  DataBase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
    path: 'fhmanager.sqlite',
    logStatements: true,
  ));

  @override
  int get schemaVersion => 1;

  void initDb() {
    into(color).insert(ColorData(name: 'Maya Blue', hexCode: '5FC9F8'));
    into(color).insert(ColorData(name: 'Sunglow', hexCode: 'FECB2E'));
    into(color).insert(ColorData(name: 'Radical Red', hexCode: 'FC3158'));
    into(color).insert(ColorData(name: 'Blue (Crayola)', hexCode: '147EFB'));
    into(color).insert(ColorData(name: 'Emerald', hexCode: '53D769'));
    into(color).insert(ColorData(name: 'Coral Red', hexCode: 'FC3D39'));
  }
}

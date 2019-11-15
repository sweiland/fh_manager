import 'package:moor_flutter/moor_flutter.dart';

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

/*static List<Color> fetchAll() {
    return [
      Color('Maya Blue', '5FC9F8'),
      Color('Sunglow', 'FECB2E'),
      Color('Radical Red', 'FC3158'),
      Color('Blue (Crayola)', '147EFB'),
      Color('Emerald', '53D769'),
      Color('Coral Red', 'FC3D39'),
    ];
  }*/
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
  final List<Teacher> teachers;
  final List<Task> tasks;
  final Color color;

  SubjectWithTasksTeachersAndColor(this.teachers, this.tasks, this.color);
}

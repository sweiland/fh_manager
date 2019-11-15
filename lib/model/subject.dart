import 'package:fh_manager/model/color.dart';
import 'package:fh_manager/model/task.dart';
import 'package:fh_manager/model/teacher.dart';

class Subject {
  final String name;
  final List<Teacher> teachers;
  final bool enrolled;
  final double ects;
  final List<Task> tasks;
  final Color color;

  Subject(this.name, this.teachers, this.enrolled, this.ects, this.tasks,
      this.color);
}

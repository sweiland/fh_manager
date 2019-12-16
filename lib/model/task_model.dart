import 'package:FH_Manager/utils/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'task_model.g.dart';

@JsonSerializable()
class Task {
  final String id, parent;
  final String name;
  @JsonKey(name: 'completed')
  final int isCompleted;

  Task(this.name, {@required this.parent, this.isCompleted = 0, String id})
      : this.id = id ?? Uuid().generateV4();

  Task copy(
      {String name,
      int isCompleted,
      int id,
      int parent,
      String description,
      DateTime dueDate}) {
    return Task(
      name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
      parent: parent ?? this.parent,
    );
  }

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$TodoFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TodoFromJson`.
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

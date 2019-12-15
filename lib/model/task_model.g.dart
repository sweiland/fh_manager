// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(json['name'] as String,
      parent: json['parent'] as String,
      description: json['description'] as String,
      dueDate: json['dueDate'] as String,
      isCompleted: json['completed'] as int,
      id: json['id'] as String);
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'name': instance.name,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'completed': instance.isCompleted
    };

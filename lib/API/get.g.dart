// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTask _$GetTaskFromJson(Map<String, dynamic> json) => GetTask(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      completed: json['completed'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$GetTaskToJson(GetTask instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'completed': instance.completed,
      'createdAt': instance.createdAt,
    };

import 'package:json_annotation/json_annotation.dart';

part 'get.g.dart';

@JsonSerializable()
class GetTask {


  GetTask({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.createdAt,
  });

  factory GetTask.fromJson(Map<String, dynamic> json) => _$GetTaskFromJson(json);
  String? id;
  String? title;
   String? description;
   bool? completed;
  String? createdAt;
  Map<String, dynamic> toJson() => _$GetTaskToJson(this);
}

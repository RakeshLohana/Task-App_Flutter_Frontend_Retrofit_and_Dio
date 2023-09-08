class GetTaskOld {
  String? sId;
  String? title;
  String? description;
  bool? completed;
  String? createdAt;
  int? iV;

  GetTaskOld(
      {this.sId,
      this.title,
      this.description,
      this.completed,
      this.createdAt,
      this.iV});

  GetTaskOld.fromJson(Map<dynamic, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    completed = json['completed'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['completed'] = this.completed;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}
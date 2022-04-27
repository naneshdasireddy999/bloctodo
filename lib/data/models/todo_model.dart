// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) =>
    List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
  Todo({
    required this.todo,
    required this.isCompleted,
    required this.id,
  });

  String todo;
  bool isCompleted;
  int id;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        todo: json["todo"],
        isCompleted: json["is completed"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "todo": todo,
        "is completed": isCompleted,
        "id": id,
      };
}

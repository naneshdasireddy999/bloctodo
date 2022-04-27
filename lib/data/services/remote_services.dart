import 'dart:convert';

import 'package:bloctodos/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();
  static Future<List<Todo>?> fetchtodo() async {
    try {
      var response = await client.get(Uri.parse('http://localhost:3000/todos'));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        return todoFromJson(jsonstring);
      } else {
        return null;
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> patchtodo(int id, Todo t) async {
    try {
      print(t.isCompleted);
      var response = await client.patch(
        Uri.parse('http://localhost:3000/todos/$id'),
        body: jsonEncode({
          "is completed": !t.isCompleted,
        }),
        headers: {"Content-type": "application/json"},
      );
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> addtodo(String s) async {
    try {
      var response = await client.post(
        Uri.parse('http://localhost:3000/todos/'),
        body: jsonEncode({
          "todo": s,
          "is completed": false,
        }),
        headers: {"Content-type": "application/json"},
      );
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      throw e;
    }
  }

  static Future<void> deletetodo(int id) async {
    try {
      var response = await client.delete(
        Uri.parse('http://localhost:3000/todos/$id'),
        headers: {"Content-type": "application/json"},
      );
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<void> edittodo(int id, String s) async {
    try {
      var response = await client.patch(
        Uri.parse('http://localhost:3000/todos/$id'),
        body: jsonEncode({"todo": s}),
        headers: {"Content-type": "application/json"},
      );
    } on Exception catch (e) {
      // TODO
    }
  }
}

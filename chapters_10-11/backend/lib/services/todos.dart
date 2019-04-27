import 'dart:convert';
import 'package:http/http.dart';

import 'package:backend/models/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Services {
  Future<List<Todo>> getTodos();

  Future<Todo> updateTodo(Todo todo);

  Future addTodo();
}

class MockServices implements Services {
  @override
  Future addTodo() {
    // TODO: implement addTodo
    return null;
  }

  @override
  Future<List<Todo>> getTodos() async {
    return [
      new Todo(1, 1, "delectus aut autem", false),
      new Todo(1, 2, "quis ut nam facilis et officia qui", false),
      new Todo(1, 3, "fugiat veniam minus", false),
      new Todo(1, 4, "et porro tempora", true),
      new Todo(1, 8, "et porro tempora", true),
      new Todo(1, 9, "et porro tempora", true),
      new Todo(1, 10, "et porro tempora", true),
      new Todo(1, 11, "et porro tempora", true),
      new Todo(1, 12, "et porro tempora", true),
      new Todo(1, 13, "et porro tempora", true),
      new Todo(1, 14, "et porro tempora", true),
      new Todo(1, 15, "et porro tempora", true),
      new Todo(1, 16, "et porro tempora", true),
    ];
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    return null;
  }
}

class HttpServices implements Services {
  Client client = new Client();

  Future<List<Todo>> getTodos() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/todos?userId=1');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var all = AllTodos.fromJson(json.decode(response.body));
      return all.todos;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load todos ');
    }
  }

  @override
  Future addTodo() {
    // TODO: implement addTodo
    return null;
  }

  @override
  Future<Todo> updateTodo(Todo todo) async {
    // post todo
    return todo;
  }
}

class FirebaseServices implements Services {
  @override
  Future addTodo() {
    return null;
  }

  @override
  Future<List<Todo>> getTodos() async {
    QuerySnapshot snapshot =
        await Firestore.instance.collection("todos").getDocuments();
    AllTodos todos = AllTodos.fromSnapshot(snapshot);
    return todos.todos;
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    return null;
  }
}

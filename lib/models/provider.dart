import 'package:flutter/cupertino.dart';
import 'package:providers/models/todo.dart';
import 'package:providers/utils/db.dart';

import '../utils/db.dart';
import 'todo.dart';

class TodoProvider extends ChangeNotifier {
  ToDodb db = ToDodb(); // A better substitute is to use these as Dependency Injection
  List<ToDo> todoList;

  Future<List<ToDo>> getTodos([ToDo toDos]) async {
    return await db.getTodos();
  }

  List<ToDo> returnTodos(toDos) {
    notifyListeners();
    return toDos;
  }

// function to delete todos
  void deleteTodo(ToDo todo) async {
    db.deleteTodo(todo).then((result) {
      getTodos();
    });
    notifyListeners();
  }

//function to update todos
  updateTodo(ToDo todo) async {
    db.updateTodo(todo).then((result) {
      getTodos();
    });
    notifyListeners();
  }

  addTodo(ToDo toDo) async {
    db.insertTodo(toDo).then((result) {
      getTodos();
    });
    notifyListeners();
  }
}

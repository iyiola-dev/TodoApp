import 'package:flutter/cupertino.dart';
import 'package:providers/models/todo.dart';
import 'package:providers/utils/db.dart';

class TodoProvider extends ChangeNotifier {
  ToDodb db;
  List<ToDo> todoList;
  Future getTodos([ToDo toDos]) async {
    List<ToDo> todos = await db.getTodos();
    todoList = todos;
    notifyListeners();
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

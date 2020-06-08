import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/provider.dart';
import 'package:providers/models/todo.dart';

class Listitem extends StatefulWidget {
  @override
  _ListitemState createState() => _ListitemState();
}

class _ListitemState extends State<Listitem> {
  static ToDo toDos;
  var tasklist = Provider.value(value: TodoProvider().getTodos(toDos));
  @override
  Widget build(BuildContext context) {
    if (toDos == null) {
      return Container(
        child: Center(
            child: Text(
          "You Do Not Have Any Task Scheduled For Today",
          style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.blue,
              fontSize: 25),
        )),
      );
    } else {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Slidable(
            child: Text("${toDos.title}"),
            actionPane: SlidableDrawerActionPane()),
      );
    }
  }
}

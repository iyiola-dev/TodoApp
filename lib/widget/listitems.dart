import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/provider.dart';
import 'package:providers/models/todo.dart';

import '../models/provider.dart';
import '../models/todo.dart';

class Listitem extends StatefulWidget {
  @override
  _ListitemState createState() => _ListitemState();
}

class _ListitemState extends State<Listitem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ToDo>>(
      future: Provider.of<TodoProvider>(context).getTodos(),
      builder: (BuildContext context, AsyncSnapshot<List<ToDo>> snapshot) {
        if (snapshot.data == null || snapshot.data.isEmpty) {
          return Container(
            child: Center(
              child: Text(
                "You Do Not Have Any Task Scheduled For Today",
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.blue, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Slidable(child: Text("${snapshot.data[1].title}"), actionPane: SlidableDrawerActionPane()),
          );
        } else
          return Container();
      },
    );
  }
}

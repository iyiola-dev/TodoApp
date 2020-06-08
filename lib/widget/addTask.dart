import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/provider.dart';
import 'package:providers/models/todo.dart';

import '../models/todo.dart';

class AddTask extends StatefulWidget {
  final bool isNew;
  final ToDo toDo;

  AddTask({this.isNew, this.toDo});

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isNew;
  ToDo toDo;

  _AddTaskState({this.isNew, this.toDo});

  DateTime selectedDate = DateTime.now();

  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPriority = TextEditingController();
  var txtCompeleteby;
  final _formKey = GlobalKey<FormState>();

  saveTodo() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String title = txtName.text.toString();
      String description = txtDescription.text.toString().trim();
      String completeBy = txtCompeleteby.toString().trim();
      int priority = int.parse(txtPriority.text.toString().trim());
      print("I was called to save a todo");
      final todo = ToDo(description: description, title: title, completeBy: completeBy, priority: priority);
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
      Navigator.of(context).pop();
//      if (isNew == true) {
//      } else {
//        // Todo work on your update here
//        Provider.value(value: TodoProvider().updateTodo(toDo));
//        Provider.of<TodoProvider>(context).updateTodo(toDo);
//      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: double.infinity,
          // use more of these
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[800],
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 90),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Text(
                              "Input your Schedule Here",
                              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Icon(
                              Icons.arrow_downward,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: TextFormField(
                      controller: txtName, // use a better naming convention
                      decoration: InputDecoration(hintText: "title", hasFloatingPlaceholder: true, border: InputBorder.none),
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Title Cannot be empty";
                        } else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: TextFormField(
                      controller: txtDescription,
                      decoration: InputDecoration(hintText: "description", hasFloatingPlaceholder: true, border: InputBorder.none),
                      validator: (String value) {
                        if (value.isEmpty || value.length < 10) {
                          return "Description cant be empty and must be of at least 10 chars";
                        } else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(
                      left: 40,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: txtPriority,
                      decoration: InputDecoration(hintText: "priority", hasFloatingPlaceholder: true, border: InputBorder.none),
                      validator: (String val) {
                        if (val.isEmpty) {
                          return "Priority cant be empty";
                        } else
                          return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    color: Colors.teal[500],
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                    ),
                    child: RaisedButton(
                      color: Colors.transparent,
                      onPressed: () => _selected(context),
                      child: Text("Pick Your Appointment Date"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.teal[500],
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                    ),
                    child: MaterialButton(
                      child: Text("Save"),
                      onPressed: () {
                        saveTodo();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _selected(BuildContext context) async {
    txtCompeleteby =
        await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2000, 1, 1), lastDate: DateTime(2050));
    if (txtCompeleteby == null && txtCompeleteby != selectedDate) {
      setState(() {
        selectedDate = txtCompeleteby;
      });
    }
  }
}

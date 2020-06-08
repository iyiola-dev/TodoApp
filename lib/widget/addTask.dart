import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/provider.dart';
import 'package:providers/models/todo.dart';
import 'package:providers/views/home.dart';

class AddTask extends StatefulWidget {
  bool isNew;
  ToDo toDo;

  AddTask({
    this.isNew,
    this.toDo,
  });
 
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  bool isNew;
  ToDo toDo;

  _AddTaskState({
    this.isNew,
    this.toDo,
  });
  DateTime selectedDate = DateTime.now();

  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  var txtCompeleteby;
  final TextEditingController txtPriority = TextEditingController();
    Future save() async {
  toDo.title  =  txtName.text;
   toDo.description = txtDescription.text ;
    toDo.completeBy = txtCompeleteby.toString();   ;
   toDo.priority = int.parse(txtPriority.toString()); 

    if (isNew == true) {
      Provider.value(value: TodoProvider().addTodo(toDo));
    } else {
      Provider.value(value: TodoProvider().updateTodo(toDo));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.teal[800],
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 90,
                ),
                Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Center(
                              child: Text(
                        "Input your Schedule Here",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ))),
                      Expanded(
                          child: Center(
                              child: Icon(
                        Icons.arrow_downward,
                        size: 60,
                        color: Colors.white,
                      ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 40,
                  ),
                  child: TextFormField(
                    controller: txtName,
                    decoration: InputDecoration(
                        hintText: "title",
                        hasFloatingPlaceholder: true,
                        border: InputBorder.none),
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
                    decoration: InputDecoration(
                        hintText: "description",
                        hasFloatingPlaceholder: true,
                        border: InputBorder.none),
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
                    decoration: InputDecoration(
                        hintText: "priority",
                        hasFloatingPlaceholder: true,
                        border: InputBorder.none),
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
                          save().then((_) {
                            Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context)=> HomePage()),
                             (Route<dynamic> route) => false,);
                          });
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _selected(BuildContext context) async {
    txtCompeleteby = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 1, 1),
        lastDate: DateTime.now());
    if (txtCompeleteby == null && txtCompeleteby != selectedDate) {
      setState(() {
        selectedDate = txtCompeleteby;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:providers/models/todo.dart';
import 'package:providers/widget/addTask.dart';
import 'package:providers/widget/listitems.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.redAccent,
          ),
          color: Colors.redAccent,
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddTask(isNew: true,)))),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(17.0),
                    bottomRight: Radius.circular(17.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Welcome to your Everday Scheduling app",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.note_add,
                        size: 100,
                        color: Colors.white12,
                      ),
                      Expanded(
                        child: Text(
                          "Create it and delete when  you're done",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Here is your data for the day",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Listitem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

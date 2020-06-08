import 'package:flutter/material.dart';
import 'package:providers/widget/listitems.dart';

import '../widget/addTask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTask(
              isNew: true,
            ),
          ),
        ),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor, // you can change the backGroundColor to white but add an elevation
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(17.0), bottomRight: Radius.circular(17.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Welcome to your Everday Scheduling app",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 30),
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
                            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
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
                    SizedBox(height: 30),
                    Text(
                      "Here is your data for the day",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.lightBlue),
                    ),
                    SizedBox(height: 30),
                    Listitem(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

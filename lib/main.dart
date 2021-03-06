import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/models/provider.dart';
import 'package:providers/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: 'Todos ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange, primaryColor: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}

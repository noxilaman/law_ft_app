import 'package:flutter/material.dart';
import './Screen/home.dart';
import './Screen/law.dart';
import './Screen/bookmark.dart';
import './Screen/moeapp.dart';

void main() {
  runApp(MyMainApp());
}

class MyMainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.purple,
        textTheme: TextTheme(body1: TextStyle(color: Colors.red)),
      ),
      title: 'First Flutter App',
      initialRoute: '/', // สามารถใช้ home แทนได้
      routes: {
        Home.routeName: (context) => Home(),
        Law.routeName:  (context) => Law(),
        Bookmark.routeName: (context) => Bookmark(),
        MoreApp.routeName: (context) => MoreApp(),
      },
    );
  }
}
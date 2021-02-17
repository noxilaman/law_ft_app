import 'package:flutter/material.dart';
import '../Components/sidemenu.dart';

class MoreApp extends StatefulWidget {
  static const routeName = '/moreapp';
  @override
  _MoreAppState createState() => _MoreAppState();
}

class _MoreAppState extends State<MoreApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moreapp'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('More App Screen'),
            ],
          )
      ),
      drawer: SideMenu(),
    );
  }
}

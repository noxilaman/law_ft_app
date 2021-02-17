import 'package:flutter/material.dart';
import '../Components/sidemenu.dart';

class Law extends StatefulWidget {
  static const routeName = '/law';
  @override
  _LawState createState() => _LawState();
}

class _LawState extends State<Law> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laws'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Laws Screen'),
            ],
          )
      ),
        drawer: SideMenu(),
    );
  }
}

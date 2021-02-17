import 'package:flutter/material.dart';
import '../Components/sidemenu.dart';

class Bookmark extends StatefulWidget {
  static const routeName = '/bookmark';
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Bookmarks Screen'),
            ],
          )
      ),
      drawer: SideMenu(),
    );
  }
}

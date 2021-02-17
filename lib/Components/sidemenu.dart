import 'package:flutter/material.dart';
import '../Screen/home.dart';
import '../Screen/law.dart';
import '../Screen/bookmark.dart';
import '../Screen/moeapp.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Guest'),
            accountEmail:Text('guest@cybereazy.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300x300.jpg'
              ),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, Home.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('Law'),
            onTap: () {
              Navigator.pushNamed(context, Law.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark),
            title: Text('Bookmark'),
            onTap: () {
              Navigator.pushNamed(context, Bookmark.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('More App'),
            onTap: () {
              Navigator.pushNamed(context, MoreApp.routeName);
            },
          ),
        ],
      ),
    );
  }
}

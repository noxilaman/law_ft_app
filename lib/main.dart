import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

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
/*

Future<Appdata> fetchAppdata() async {
  final response =
  await http.get('https://cybereazy.com/aryalaw/web/api/getappdata?android_id=com.kodmay.thaicriminallaw');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Appdata.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class Appdata {
  final int id;
  final String name;
  final String app_img;
  final String app_desc;
  final String app_id;
  final int store_id;

  Appdata({this.id,
    this.name,
    this.app_img,
    this.app_desc,
    this.app_id,
    this.store_id
  });

  factory Appdata.fromJson(Map<String, dynamic> json) {


    return Appdata(
      id: json['dataList'][0]['id'],
      name: json['dataList'][0]['name'],
      app_img: json['dataList'][0]['app_img'],
      app_desc: json['dataList'][0]['app_desc'] as String,
      app_id: json['dataList'][0]['app_id'],
      store_id: json['dataList'][0]['store_id'],
    );
  }

}


class HomePage1 extends StatefulWidget {

  HomePage1({Key key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  Future<Appdata> futureAppdata;
  @override
  void initState() {
    super.initState();
    futureAppdata = fetchAppdata();
  }

  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            icon: Icon(
                Icons.home
            ), onPressed: () {}),
        title: Text("Thai Criminal Law",textAlign: TextAlign.left,),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                  Icons.person
              ), onPressed: () {}),
        ],
      ),
      body: Center(
        child: FutureBuilder<Appdata>(
          future: futureAppdata,
          builder: (context, snapshot) {
            debugPrint('movieTitle: $snapshot');
            if (snapshot.hasData) {

              return Html(
                data: snapshot.data.app_desc,
                padding: EdgeInsets.all(8.0),
                onLinkTap: (url) {
                  print("Opening $url...");
                },
                customRender: (node, children) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case "custom_tag": // using this, you can handle custom tags in your HTML
                        return Column(children: children);
                    }
                  }
                },
              );



              return Text(snapshot.data.app_desc);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Law',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'MoreApp',
          ),
        ],
      ),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Thai Criminal Law",
      theme: ThemeData(primaryColor: Colors.red[300]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}*/

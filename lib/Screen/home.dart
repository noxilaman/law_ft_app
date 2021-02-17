import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import '../Components/sidemenu.dart';


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
    debugPrint('movieddddddTitleError ');
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

class Home extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Future<Appdata> futureAppdata;
  @override
  void initState() {
    super.initState();
    futureAppdata = fetchAppdata();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
                child: FutureBuilder<Appdata>(
                  future: futureAppdata,
                  builder: (context, AsyncSnapshot<Appdata> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('none');
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                        return Text('');
                      case ConnectionState.done:
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
                    }
                  }
                ),
      ),
      drawer: SideMenu(),
    );
  }
}
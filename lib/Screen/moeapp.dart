import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';
import '../Components/sidemenu.dart';


Future<List<Appdata>> fetchAppdata() async {
  var uri =
  Uri.https('cybereazy.com', '/aryalaw/web/api/listapp');
  final response =
  await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.



    return (json.decode(response.body)['dataList'] as List)
          .map((p) => Appdata.fromJson(p))
          .toList();
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
      id: json['id'],
      name: json['name'],
      app_img: json['app_img'],
      app_desc: json['app_desc'] as String,
      app_id: json['app_id'],
      store_id: json['store_id'],
    );
  }

}

_launchURL() async {
  const url = 'https://play.google.com/store/apps/details?id=';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class MoreApp extends StatefulWidget {
  static const routeName = '/moreapp';
  @override
  _MoreAppState createState() => _MoreAppState();
}

class _MoreAppState extends State<MoreApp> {
  Future<List<Appdata>> futureAppdata;
  @override
  void initState() {
    super.initState();
    futureAppdata = fetchAppdata();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('More App'),
      ),
      body: Center(
        child: FutureBuilder<List<Appdata>>(
            future: futureAppdata,
            builder: (context, AsyncSnapshot<List<Appdata>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('none');
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return Text('');
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            ListTile(
                              leading: Image.network(snapshot.data[index].app_img),
                              title: Text(snapshot.data[index].name),
                              onTap: () {
                                //launchURL(snapshot.data[index].app_id);
                                launch('https://play.google.com/store/apps/details?id=$snapshot.data[index].app_id');
                              },
                            );
                        },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    );
                    // return Text('');
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

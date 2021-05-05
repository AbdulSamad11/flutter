import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        "https://pcc.edu.pk/ws/list/mms_providers.php",
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = jsonDecode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Column(
              children: [
                Text(data[index]['firstName']),
                Text(data[index]['lastName']),
                Text(data[index]['gender']),
                Text(data[index]['email']),
                Text(data[index]['phone'])
              ],
            ),
          );
        },
      ),
    );
  }
}

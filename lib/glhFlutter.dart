import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GHFlutter extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return GHFlutterState();
    }
}

var _members = [];
final _biggerFont = const TextStyle(fontSize: 18);

class GHFlutterState extends State<GHFlutter> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        appBar: AppBar(
           title: Text("fhnihao")
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: _members.length,
          itemBuilder: (BuildContext context, int pos) {
            return _buildRow(pos);
          },
        ),
      );
    }
    _loadData() async {
      String dataURL = "https://api.github.com/orgs/raywenderlich/members";
      http.Response response = await http.get(dataURL);
      setState(() {
        // print(json.decode(response.body));
        _members = json.decode(response.body);
      });
    }
    @override
      void initState() {
        // TODO: implement initState
        super.initState();
        _loadData();
      }

  Widget _buildRow(int i) => Padding(
    padding: EdgeInsets.all(16.0),
    child: ListTile(
      title: Text("${_members[i]["login"]}", style: _biggerFont),
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[i]["avatar_url"])
      ),
    )
  );
}
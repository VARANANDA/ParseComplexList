import 'package:flutter/material.dart';
import 'package:complexjson/EasyJsonParse/Services.dart';
import 'package:complexjson/EasyJsonParse/Users.dart';

class JsonParseDemo extends StatefulWidget {
  JsonParseDemo() : super();

//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return null;
//  }

  //Below Statement is Same as Above Statement(auto generated) just replacing the widget

  @override
  JsonParseDemoState createState() => JsonParseDemoState();
}

class JsonParseDemoState extends State<JsonParseDemo> {
  List<Users> _users;
  bool _loading;

  @override
  void initState() {
    super.initState();

    this._loading = true;

    Services.getUsers().then((user) {
      setState(() {
        _users = user;
        this._loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this._loading ? 'Loading...' : 'Users'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == _users ? 0 : _users.length,
            itemBuilder: (context, index) {
              Users user = _users[index];

              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            }),
      ),
    );
  }
}

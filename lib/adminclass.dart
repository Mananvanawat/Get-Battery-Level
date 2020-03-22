import 'package:flutter/material.dart';

class admin extends StatefulWidget {
  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Text('Enter food recipe:'),
            TextField(),
              RaisedButton(onPressed: (){},)
            ],
          ),
        ),
      ),
    );

  }
}

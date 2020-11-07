import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: userText
    );
  }
}

Widget userText = new Container(
    decoration: new BoxDecoration(color: Colors.white),
    padding: const EdgeInsets.all(32.0),
    child: new Text(
      'editPage',
      softWrap: true,
    ));


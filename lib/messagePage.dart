import 'package:flutter/material.dart';

class MsgPage extends StatelessWidget {
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
      'Message Page',
      softWrap: true,
    ));


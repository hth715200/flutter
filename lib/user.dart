import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(child: userTextPage);
  }
}

// Widget userText = new Container(
//     decoration: new BoxDecoration(color: Colors.white),
//     padding: const EdgeInsets.all(32.0),
//     child: new Text(
//       'User Page',
//       softWrap: true,
//     ));

final fakeData = ['乌龙茶', '北千住', 'VIP-2', 'User-Number'];

Widget userTextPage = new Container(
  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
  child: new Column(
    mainAxisSize: MainAxisSize.max,
    textBaseline: TextBaseline.alphabetic,
    children: [
      buildUserInfoRow(Icons.edit, 'Name', fakeData[0]),
      buildUserInfoRow(Icons.map, 'Address', fakeData[1]),
      buildUserInfoRow(Icons.priority_high, 'VIP', fakeData[2]),
      buildUserInfoRow(Icons.format_shapes, 'Serial-Number', fakeData[3]),
    ],
  ),
);

Container buildUserInfoRow(IconData iconData, String title, String content) {
  return new Container(
    padding: EdgeInsets.symmetric(vertical: 20.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Icon(iconData, color: Colors.blueGrey, size: 14.0,),
          new Expanded(
            child: new Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: new Text(
                title,
                style: new TextStyle(fontSize: 14.0),
              ),
            ),
          ),
          new Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              child: Text(
                content,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ),
          new Icon(Icons.chevron_right, color: Colors.blueGrey)
        ],
      ));
}

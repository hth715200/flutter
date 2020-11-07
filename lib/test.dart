import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/edithPage.dart';
import 'package:flutter_app/messagePage.dart';
import 'package:flutter_app/user.dart';

class Test extends StatelessWidget {
  // Test({this.title});
  //
  // final Widget title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeStatefulWidget(),
      routes: <String, WidgetBuilder>{
        '/user_page': (BuildContext context) => UserPage(),
      },
    );
  }
}

Widget buttonSection = new Container(
  child: new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      buildButtonColumn(Icons.home, 'HOME'),
      buildButtonColumn(Icons.devices_other, 'OTHER'),
      buildButtonColumn(Icons.edit, 'EDIT'),
      buildButtonColumn(Icons.person, 'ACCOUNT')
    ],
  ),
);

Column buildButtonColumn(IconData iconData, String text) {
  Color color = Colors.blue;
  return new Column(
    children: [
      new Icon(iconData, color: color),
      new Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: new Text(
            text,
            style: new TextStyle(color: color),
          ))
    ],
  );
}

Widget textSection = new Container(
    decoration: new BoxDecoration(color: Colors.white),
    padding: const EdgeInsets.all(32.0),
    child: new Text(
      '乌龙茶，2019年12月6日出生。'
      '\n于2020年2月14日晚来到乌龙小院。',
      softWrap: true,
    ));

Widget titleSection = new Container(
    decoration: new BoxDecoration(color: Colors.white),
    // child: new Center(
    //   child: new Text("Hello world",textDirection: TextDirection.ltr,style: new TextStyle(fontSize: 40,color: Colors.black87)),
    // ),
    padding: const EdgeInsets.all(32.0),
    child: new Row(
      children: [
        new Expanded(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new Text('xxxxxonononononononoxbbbbbbb'),
            ),
            new Text('pppppppppppppppppp')
          ],
        )),
        new FavoriteWidget()
      ],
    ));

class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        new IconButton(
          onPressed: toggleFavorite,
          icon: new Icon(
            _isFavorited ? Icons.star : Icons.star_border,
            color: Colors.red,
          ),
        ),
        new SizedBox(
            width: 18,
            child: new Container(
              child: Text('$_favoriteCount'),
            ))
      ],
    );
  }

  void toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }
}

class HomeStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeStatefulWidgetState();
}

final pages = [EditPage(),MsgPage(),UserPage()];

class _HomeStatefulWidgetState extends State<HomeStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('乌龙App'),
        backgroundColor: Colors.blue,
      ),
      body: _selectedIndex == 0 ? listCombined : pages[_selectedIndex-1],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber[800],
        iconSize: 20,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.amber[800]),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
      ),
    );
  }

  int _selectedIndex = 0;

  Widget listCombined = new ListView(
    children: [
      new Image.asset(
        'images/wulong_1.jpg',
        height: 320.0,
        fit: BoxFit.cover,
      ),
      titleSection,
      textSection,
      buttonSection
    ],
  );

// Widget _changeFragment(int index, BuildContext context) {
//   switch (index) {
//     case 0:
//       return listCombined;
//       break;
//     case 1:
//       // Navigator.pop(context);
//       // Navigator.pushNamed(context, '/user_page');
//       Navigator.push(
//           context, new MaterialPageRoute(builder: (context) => new User()));
//       break;
//     case 2:
//       return listCombined;
//       break;
//     case 3:
//       return listCombined;
//       break;
//   }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void main() {
  runApp(new Test());
}

// / Flutter code sample for Navigator
//
// The following example demonstrates how a nested [Navigator] can be used to
// present a standalone user registration journey.
//
// Even though this example uses two [Navigator]s to demonstrate nested
// [Navigator]s, a similar result is possible using only a single [Navigator].
//
// Run this example with `flutter run --route=/signup` to start it with
// the signup flow instead of on the home page.
//
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Code Sample for Navigator',
//       // MaterialApp contains our top-level Navigator
//       initialRoute: '/',
//       routes: {
//         '/': (BuildContext context) => HomePage(),
//         '/signup': (BuildContext context) => SignUpPage(),
//       },
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: Theme.of(context).textTheme.headline4,
//       child: Container(
//         color: Colors.white,
//         alignment: Alignment.center,
//         child: Text('Home Page'),
//       ),
//     );
//   }
// }
//
// class CollectPersonalInfoPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: Theme.of(context).textTheme.headline4,
//       child: GestureDetector(
//         onTap: () {
//           // This moves from the personal info page to the credentials page,
//           // replacing this page with that one.
//           Navigator.of(context)
//               .pushReplacementNamed('signup/choose_credentials');
//         },
//         child: Container(
//           color: Colors.lightBlue,
//           alignment: Alignment.center,
//           child: Text('Collect Personal Info Page'),
//         ),
//       ),
//     );
//   }
// }
//
// class ChooseCredentialsPage extends StatelessWidget {
//   const ChooseCredentialsPage({
//     this.onSignupComplete,
//   });
//
//   final VoidCallback onSignupComplete;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onSignupComplete,
//       child: DefaultTextStyle(
//         style: Theme.of(context).textTheme.headline4,
//         child: Container(
//           color: Colors.pinkAccent,
//           alignment: Alignment.center,
//           child: Text('Choose Credentials Page'),
//         ),
//       ),
//     );
//   }
// }
//
// class SignUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // SignUpPage builds its own Navigator which ends up being a nested
//     // Navigator in our app.
//     return Navigator(
//       initialRoute: 'signup/personal_info',
//       onGenerateRoute: (RouteSettings settings) {
//         WidgetBuilder builder;
//         switch (settings.name) {
//           case 'signup/personal_info':
//           // Assume CollectPersonalInfoPage collects personal info and then
//           // navigates to 'signup/choose_credentials'.
//             builder = (BuildContext _) => CollectPersonalInfoPage();
//             break;
//           case 'signup/choose_credentials':
//           // Assume ChooseCredentialsPage collects new credentials and then
//           // invokes 'onSignupComplete()'.
//             builder = (BuildContext _) => ChooseCredentialsPage(
//               onSignupComplete: () {
//                 // Referencing Navigator.of(context) from here refers to the
//                 // top level Navigator because SignUpPage is above the
//                 // nested Navigator that it created. Therefore, this pop()
//                 // will pop the entire "sign up" journey and return to the
//                 // "/" route, AKA HomePage.
//                 Navigator.of(context).pop();
//               },
//             );
//             break;
//           default:
//             throw Exception('Invalid route: ${settings.name}');
//         }
//         return MaterialPageRoute(builder: builder, settings: settings);
//       },
//     );
//   }
// }

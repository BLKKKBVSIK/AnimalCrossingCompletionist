import 'package:flutter/material.dart';
import 'pages/todo_list_page/todo_list_page.dart';
import 'pages/onboard_page.dart';
import 'user.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('userName') != null)
    User.name = prefs.getString('userName');
  if (prefs.getBool('darkNightMode') != null) {
    User.darkKnightMode = prefs.getBool('darkNightMode');
  } else {
    prefs.setBool('darkNightMode', false);
    User.darkKnightMode = prefs.getBool('darkNightMode');
  }

  User.prefs = prefs;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AC Completionist',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(
        'res/splash.flr',
        User.name != null ? new TodoListPage() : new OnboardPage(),
        startAnimation: 'splash',
      ),
      routes: {
        TodoListPage.routeName: (BuildContext ctx) => TodoListPage(),
      },
    );
  }
}

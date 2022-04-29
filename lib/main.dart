import 'package:flutter/material.dart';
import 'package:sparanghel/pages/home.dart';
import 'package:sparanghel/pages/leaderboard.dart';
import 'package:sparanghel/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFFD3ECA7),
        backgroundColor: const Color(0xFFA1B57D),
        scaffoldBackgroundColor: const Color(0xFFA1B57D),
        textTheme: const TextTheme(
          headline1: TextStyle(color: Color(0xFFDEDEDE)),
          headline2: TextStyle(color: Color(0xFFDEDEDE)),
          bodyText1: TextStyle(color: Color(0xFFDEDEDE)),
          bodyText2: TextStyle(color: Color(0xFFDEDEDE)),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFB33030),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const LoginPage(),
      routes: {
        "/login": (_) => LoginPage(),
        "/home": (_) => HomePage(),
        "/leaderboard": (_) => LeaderboardPage(),
      },
    );
  }
}

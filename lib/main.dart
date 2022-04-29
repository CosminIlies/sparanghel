import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparanghel/pages/home.dart';
import 'package:sparanghel/pages/leaderboard.dart';
import 'package:sparanghel/pages/login.dart';
import 'package:sparanghel/pages/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(MyApp());
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
        "/main": (_) => MainPage(),
        "/login": (_) => LoginPage(),
        "/home": (_) => HomePage(),
        "/leaderboard": (_) => LeaderboardPage(),
      },
    );
  }
}

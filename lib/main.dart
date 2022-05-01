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
          headline1: TextStyle(color: Color(0xFF19282F)),
          headline2: TextStyle(color: Color(0xFF19282F)),
          bodyText1: TextStyle(color: Color(0xFF19282F)),
          bodyText2: TextStyle(color: Color(0xFF19282F)),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFB33030),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const LoginPage(),
      routes: {
        "/main": (_) => const MainPage(),
        "/login": (_) => const  LoginPage(),
        "/home": (_) => const  HomePage(),
        "/leaderboard": (_) => const LeaderboardPage(),
      },
    );
  }
}

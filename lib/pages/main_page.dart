import 'package:flutter/material.dart';
import 'package:sparanghel/pages/home.dart';
import 'package:sparanghel/pages/leaderboard.dart';
import 'package:sparanghel/pages/profile.dart';
import 'package:sparanghel/services/auth.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 1;
  final _scenes = [
    const LeaderboardPage(),
    const HomePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scenes[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: const Color(0xFFB33030),
          currentIndex: _currentPage,
          onTap: (index) => setState(() => _currentPage = index),
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: "Leaderboard",
                backgroundColor: Color(0xFFB33030)),
            const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Color(0xFFB33030)),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(AuthService.user!.profilePic),
                ),
                label: "Profile",
                backgroundColor: const Color(0xFFB33030)),
          ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sparanghel/components/leaderboard_position.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LeaderboardPosition(),
              LeaderboardPosition(),
              LeaderboardPosition(),
            ],
          )),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB33030),
        title: const Center(
          child: Text('Leaderboard'),
        ),
      ),
    );
  }
}

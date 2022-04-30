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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Complete tests to earn points and climb the leaderboard!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: const [
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                    LeaderboardPosition(),
                  ],
                ),
              ],
            ),
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

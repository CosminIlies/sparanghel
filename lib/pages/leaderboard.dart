import 'package:flutter/material.dart';
import 'package:sparanghel/components/leaderboard_position.dart';
import 'package:sparanghel/models/user_model.dart';
import 'package:sparanghel/services/database.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<UserModel> users = [];

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
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FutureBuilder(
                    future: DatabaseService.getAllUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        users = snapshot.data as List<UserModel>;
                        users.sort((user1, user2) =>
                            -user1.points.compareTo(user2.points));
                        return Column(
                            children: users
                                .map((e) => LeaderboardPosition(
                                      user: e,
                                      index: users.indexOf(e) + 1,
                                    ))
                                .toList());
                      } else {
                        return const Text("loading...");
                      }
                    }),
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

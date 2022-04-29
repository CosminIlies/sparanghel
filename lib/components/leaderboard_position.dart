import 'package:flutter/material.dart';

class LeaderboardPosition extends StatefulWidget {
  const LeaderboardPosition({Key? key}) : super(key: key);

  @override
  State<LeaderboardPosition> createState() => _LeaderboardPositionState();
}

class _LeaderboardPositionState extends State<LeaderboardPosition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: const Text(
        '1',
        textAlign: TextAlign.left,
      ),
      color: const Color.fromARGB(255, 32, 32, 32),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(1.0),
    );
  }
}

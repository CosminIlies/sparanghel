import 'package:flutter/material.dart';
import 'package:sparanghel/models/user_model.dart';

class LeaderboardPosition extends StatefulWidget {
  final UserModel user;
  final int index;
  const LeaderboardPosition({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  State<LeaderboardPosition> createState() => _LeaderboardPositionState();
}

class _LeaderboardPositionState extends State<LeaderboardPosition> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Text(
            widget.index.toString() + '.',
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(widget.user.profilePic),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            widget.user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(),
          Expanded(
            child: Text(
              widget.user.points.toString() + 'P ',
              textAlign: TextAlign.right,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
      color: const Color(0xFFD3ECA7),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(1.0),
    );
  }
}

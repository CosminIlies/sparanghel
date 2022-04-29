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
      child: Row(
        children: const [
          Text(
            '1.',
            textAlign: TextAlign.left,
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://cdn.discordapp.com/attachments/305977231115550720/969677810975273010/WhatsApp_Image_2022-04-28_at_11.39.02_PM.jpeg'),
          ),
          SizedBox(
            width: 20,
          ),
          Text('Marian Puiu'),
          SizedBox(),
          Expanded(
            child: Text(
              '20P',
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
      color: const Color.fromARGB(255, 32, 32, 32),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(1.0),
    );
  }
}

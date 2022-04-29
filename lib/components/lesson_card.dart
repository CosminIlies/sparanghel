import 'package:flutter/material.dart';

class LessonCard extends StatefulWidget {
  const LessonCard({Key? key}) : super(key: key);

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFD3ECA7),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                'https://picsum.photos/250?image=9',
                width: 50,
              ),
              Text("Determinant de gradul 4")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("i")),
              ElevatedButton(onPressed: () {}, child: Text("Take quiz")),
              Text("20")
            ],
          ),
        ]),
      ),
    );
  }
}

import 'package:sparanghel/models/problem.dart';

class Quiz {
  String name;
  List<Problem> problems;
  int points;
  Quiz(this.name, this.problems, this.points);
}

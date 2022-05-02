import 'package:sparanghel/models/problem.dart';

class Quiz {
  List<Problem> problems;
  int points;
  int nrOfProblems;
  Quiz(this.problems, this.points, this.nrOfProblems);
}

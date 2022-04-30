import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparanghel/models/problem.dart';
import 'package:sparanghel/models/quiz.dart';
import 'package:sparanghel/models/user_model.dart';
import 'package:sparanghel/services/auth.dart';

class DatabaseService {
  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  static final CollectionReference quizCollection =
      FirebaseFirestore.instance.collection("quizzes");

  static Future<UserModel?> getUser(String id) async {
    UserModel? _user;
    try {
      await usersCollection.doc(id).get().then((DocumentSnapshot snapshot) {
        _user = UserModel(snapshot["uid"], snapshot["name"],
            snapshot["profilePic"], snapshot["points"]);
      });
    } catch (e) {
      usersCollection.doc(AuthService.user!.uid).set({
        "uid": AuthService.user!.uid,
        "name": AuthService.user!.name,
        "profilePic": AuthService.user!.profilePic,
        "points": AuthService.user!.points,
      });
      return null;
    }

    return _user;
  }

  static Future<List<Quiz>> getAllQuizzes() async {
    List<Quiz> quizzes = [];
    QuerySnapshot snapshot = await quizCollection.get();

    for (var doc in snapshot.docs) {
      Quiz? quiz = await getQuiz(doc.id);
      quizzes.add(quiz!);
    }

    return quizzes;
  }

  static Future<Quiz?> getQuiz(String id) async {
    Quiz? quiz;

    await quizCollection.doc(id).get().then((DocumentSnapshot snapshot) async {
      quiz = Quiz(snapshot["name"], await getProblems(id), snapshot["points"]);
    });

    return quiz;
  }

  static Future<List<Problem>> getProblems(String quizId) async {
    List<Problem> problems = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('quizzes/' + quizId + "/problems")
        .get();

    for (var doc in querySnapshot.docs) {
      List<String> options = [
        "Option 1",
        "Option 2",
        "option 3",
        "option 4",
      ];

      //add options

      problems.add(Problem(doc["body"], options, doc["ans"]));
    }

    return problems;
  }
}

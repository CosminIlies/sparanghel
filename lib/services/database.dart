import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sparanghel/models/user_model.dart';
import 'package:sparanghel/services/auth.dart';

class DatabaseService {
  static final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

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
}

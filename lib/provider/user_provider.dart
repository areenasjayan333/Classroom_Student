import 'package:classroom_user/resusable/utilies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class User {
  String id;
  String rollNo;
  String name;
  String classNo;
  String email;

  User(
      {required this.id,
      required this.rollNo,
      required this.name,
      required this.classNo,
      required this.email});
}

class UserProvider with ChangeNotifier {
  final _cloud = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  User? _user;

  User? get user {
    return _user;
  }

  Future<ProviderResponse> getAdminDetails({required String email}) async {
    try {
      final result = await _cloud
          .collection('user')
          .where('email', isEqualTo: email)
          .get();
      final data = result.docs.first.data();

      _user = User(
        name: data["name"],
        rollNo: data["rollNo"],
        classNo: data["classNo"],
        email: data["email"],
        id: result.docs.first.id,
      );

      print(_user!.name);
      notifyListeners();
      return ProviderResponse.success;
    } catch (e) {
      return ProviderResponse.error;
    }
  }
}

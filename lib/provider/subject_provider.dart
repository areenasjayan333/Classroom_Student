import 'package:classroom_user/resusable/utilies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class Subject {
  String id;
  String name;
  String classNo;

  Subject({
    required this.id,
    required this.name,
    required this.classNo,
  });
}

class SubjectProvider with ChangeNotifier {
  final _cloud = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Subject? _subject;

  Subject? get subject {
    return _subject;
  }

  Future<ProviderResponse> getSubjectDetails({required String id}) async {
    try {
      final result =
          await _cloud.collection('user').where('id', isEqualTo: id).get();
      final data = result.docs.first.data();

      _subject = Subject(
        name: data["name"],
        classNo: data["classNo"],
        id: result.docs.first.id,
      );

      print(_subject!.name);
      notifyListeners();
      return ProviderResponse.success;
    } catch (e) {
      return ProviderResponse.error;
    }
  }
}

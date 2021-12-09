import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireProv extends ChangeNotifier {
  var inst = FirebaseFirestore.instance;
  var userId = FirebaseAuth.instance.currentUser;

  // FireStore om de gegevens op te slaan van de gebruiker (IN PROGRESS)

  Stream<List> get getUserData {
    return inst
        .collection(userId!.uid)
        .snapshots()
        .map((snapshots) => snapshots.docs.toList());
  }

  void setUserData(String day, bool checked, String topic,) {
    inst
        .collection(userId!.uid)
        .doc(day)
        .set({'day': day, 'topic': topic, 'checked': checked, 'widgets': {
        },});
  }

    void updateData(String day, updateVar, update) {
      inst.collection(userId!.uid).doc(day).update({
        updateVar.toString(): update,
      });
    }
}

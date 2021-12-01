import 'package:cloud_firestore/cloud_firestore.dart';

// Firebase
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireProv extends ChangeNotifier {
  User? user = FirebaseAuth.instance.currentUser;

  // FireStore om de gegevens op te slaan van de gebruiker (IN PROGRESS)

  Stream <QuerySnapshot>get getUserData {
    var inst = FirebaseFirestore.instance;
    var collectie = inst.collection(user!.uid);
    print('collectione' + collectie.toString());
    return collectie.snapshots();
  }

   Stream<String> get age async* {
    var i = 5;
    while (i < 85) {
      await Future.delayed(Duration(seconds: 1), () {
        i++;
      });
      yield i.toString();
    }
  }
}

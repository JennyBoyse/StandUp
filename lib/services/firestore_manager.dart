import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/form_data.dart';

class FirestoreManager {
  SharedPreferences prefs;

  FirestoreManager({required this.prefs});

  static getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // DocumentReference? firestoreUser;
    // String? uid = prefs.getString('userId');
    // if (uid != null) {
    //   firestoreUser = FirebaseFirestore.instance.collection('users').doc(uid);
    // }
    return FirestoreManager(prefs: prefs);
  }

  void updateFromFirebase() {
    String? uid = prefs.getString("id");

    if (uid != null) {
      FirebaseFirestore.instance.collection('users').doc(uid).get()
          .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              prefs.setString("email", documentSnapshot.get("email"));
              prefs.setString("interval", documentSnapshot.get("interval"));
              prefs.setString("lastProcessed", documentSnapshot.get("lastProcessed"));
              prefs.setString("lunchBreak", documentSnapshot.get("lunchBreak"));
              prefs.setString("lunchDuration", documentSnapshot.get("lunchDuration"));
              prefs.setString("startTime", documentSnapshot.get("startTime"));
              prefs.setString("endTime", documentSnapshot.get("endTime"));
              prefs.setString("tokenID", documentSnapshot.get("tokenID"));
            }
          });
    }
  }

  // Return all of the user data
  Map<String, String> readUserData() {
    return {
      "uid": prefs.getString("id") ?? "",
      "email": prefs.getString("email") ?? "",
      "interval": prefs.getString("interval") ?? "",
      "lastProcessed": prefs.getString("lastProcessed") ?? "",
      "lunchBreak": prefs.getString("lunchBreak") ?? "",
      "lunchDuration": prefs.getString("lunchDuration") ?? "",
      "startTime": prefs.getString("startTime") ?? "",
      "endTime": prefs.getString("endTime") ?? "",
      "tokenID": prefs.getString("tokenID") ?? ""
    };
  }

  // Update the user id for the user on Firestore
  updateOrCreateUser(dynamic userData) {
    if ((prefs.getString("id") ?? "") == "") {
      createUser(userData);
    } else {
      updateUser(userData);
    }
  }

  // Create a new user on Firestore
  void createUser(dynamic userData) {
    Map<String, String>? data;
    if (userData is Map<String, String>) {
      data = userData;
    } else if (userData is User) {
      data = {
        "email": userData.id,
        "interval": userData.interval,
        "lastProcessed": userData.lastProcessed,
        "lunchBreak": userData.lunchBreak,
        "lunchDuration": userData.lunchDuration,
        "startTime": userData.startTime,
        "endTime": userData.endTime
      };
    } else {
      return;
    }

    data["lastProcessed"] = "";
    data["tokenID"] = prefs.getString("tokenID") ?? "";

    FirebaseFirestore.instance.collection('users')
        .add(data)
        .then((DocumentReference doc) => prefs.setString("id", doc.id))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // Update user data in shared preferences and Firestore
  void updateUser(dynamic userData, {bool updateFirebase = true}) {
    Map<String, String>? data;
    if (userData is Map<String, String>) {
      data = userData;
    } else if (userData is User) {
      data = {
        "email": userData.id,
        "interval": userData.interval,
        "lastProcessed": userData.lastProcessed,
        "lunchBreak": userData.lunchBreak,
        "lunchDuration": userData.lunchDuration,
        "startTime": userData.startTime,
        "endTime": userData.endTime,
        "tokenID": userData.tokenID
      };
    } else {
      return;
    }

    for (var entry in data.entries) {
      prefs.setString(entry.key, entry.value);
    }

    if (updateFirebase) {
      _updateFirebase(data);
    }
  }

  _updateFirebase(Map<String, String> data) {
    var uid = prefs.getString("id");
    print(uid);

    if (uid != null) {
      FirebaseFirestore.instance.collection('users')
          .doc(uid)
          .set(data, SetOptions(merge: true))
          .catchError((error) => print('Failed to update user: $error'));
    }
  }
}

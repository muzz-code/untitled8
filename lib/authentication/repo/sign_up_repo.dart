import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpRep {
  static Future<UserCredential?> firebaseSignUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    String? referralCode,
  }) async {
    try {
      // Create user with Firebase Authentication
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get the UID of the newly created user
      final String uid = credential.user!.uid;

      // Store additional user details in Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'email': email,
        'referralCode': referralCode ?? '', // Default to empty string if null
        'createdAt': DateTime.now().toIso8601String(),
      });
      return credential;
    } catch (e) {
      log("Error during sign up: $e");
      return null;
    }
  }
}

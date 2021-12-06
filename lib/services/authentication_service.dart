import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(String email, String password) async {
    try {
       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
       return "worked";
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }

  Future<String> signUp(String email, String password, String firstName, String lastName, String username, String location, String phoneNumber) async {
    try {
      UserCredential userCred = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCred.user;
      String uid = user == null ? "" : user.uid;
      await FirebaseFirestore.instance.collection("users").doc(uid).set({'firstName' : firstName, 'lastName' : lastName, 'username' : username, 'location': location, 'phoneNumber' : phoneNumber});
      return "worked";
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }
}
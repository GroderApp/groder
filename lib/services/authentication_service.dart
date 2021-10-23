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
       return "Signed in";
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }

  Future<String> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "User Created";
    } on FirebaseAuthException catch (e) {
      print(e.message.toString());
      return e.message.toString();
    }
  }
}
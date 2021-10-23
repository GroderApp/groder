import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groder/authScreens/authenticate.dart';
import 'package:groder/home.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            Provider<AuthenticationService>(
                create: (_) => AuthenticationService(FirebaseAuth.instance),
            ),

            StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChanges,
              initialData: null,
            )
          ],
          child: MaterialApp(
            title: 'Groder',
            theme: ThemeData(
            primarySwatch: Colors.green,
            ),
          home: AuthenticationWrapper(),
        ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if(firebaseUser == null) {
      print("Signed out");
      return Authenticate();
    } else {
      print("Signed In");
      return HomePage();
    }
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groder/profile.dart';
import 'package:groder/shared/groder_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groder/authScreens/authenticate.dart';
import 'package:groder/home.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:provider/provider.dart';
import 'search.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Poppins',
              primarySwatch: GroderColors.greenMaterial,
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
      return Authenticate();
    } else {
      return Search();
    }
  }
}


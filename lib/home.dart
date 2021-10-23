import 'package:flutter/material.dart';
import 'package:groder/services/authentication_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            child: Text("HOME"),
            onTap: () {
              context.read<AuthenticationService>().signOut();
              //Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
        ),
      )
    );
  }
}

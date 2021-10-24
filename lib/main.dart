import 'package:flutter/material.dart';
import 'package:groder/profile.dart';
import 'package:groder/shared/groder_colors.dart';

import 'search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groder',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: GroderColors.greenMaterial,
      ),
      home: const MyHomePage(title: 'Groder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Search(),
      ),
    );
  }
}

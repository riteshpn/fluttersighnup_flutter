import 'package:flutter/material.dart';
import 'package:fluttersighnup_flutter/home.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      home: SignUpScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'facebook_signin_demo.dart';
import 'google_signin_demo.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Google Sign In',
//      title: 'Facebook Sign In',
      debugShowCheckedModeBanner: false,
      home: GoogleSignInDemo(),
      //   home: FacebookDemo(),
    ),
  );
}

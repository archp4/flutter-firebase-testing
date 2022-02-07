// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_firebase_auth/views/home.dart';
import 'package:test_firebase_auth/views/login.dart';
import 'package:test_firebase_auth/views/register.dart';

class MyAuth extends StatefulWidget {
  const MyAuth({Key? key}) : super(key: key);

  @override
  State<MyAuth> createState() => _MyAuthState();
}

class _MyAuthState extends State<MyAuth> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user == null) {
      return const MyAuth2();
    } else {
      return const HomeView();
    }
  }
}

class MyAuth2 extends StatefulWidget {
  const MyAuth2({Key? key}) : super(key: key);

  @override
  State<MyAuth2> createState() => _MyAuth2State();
}

class _MyAuth2State extends State<MyAuth2> {
  bool showSignIn = true;
  @override
  Widget build(BuildContext context) {
    toggleView() {
      setState(() {
        showSignIn = !showSignIn;
        print("here" + showSignIn.toString());
      });
    }

    if (showSignIn) {
      return LogInView(toggle: toggleView);
    } else {
      return RegisterView(toggle: toggleView);
    }
  }
}

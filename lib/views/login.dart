// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_firebase_auth/services/auth_helper.dart';

class LogInView extends StatefulWidget {
  final Function toggle;
  const LogInView({Key? key, required this.toggle}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String email = "", pass = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              widget.toggle();
              setState(() {});
            },
            icon: const Icon(Icons.app_registration),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const Text("Login "),
                  const SizedBox(height: 60),
                  TextFormField(
                    onChanged: (val) => email = val,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) => pass = val,
                  ),
                  const SizedBox(height: 60),
                  Container(
                    width: MediaQuery.of(context).size.width - 40,
                    height: 30,
                    decoration: const BoxDecoration(),
                    child: ElevatedButton(
                      onPressed: () {
                        print(email);
                        print(pass);
                        AuthHelper().signInWithEmailAndPassword(email, pass);
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

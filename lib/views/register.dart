// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_firebase_auth/services/auth_helper.dart';

class RegisterView extends StatelessWidget {
  final Function toggle;
  const RegisterView({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = "", pass = "";
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              toggle();
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                const Text("Register"),
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
                      AuthHelper().registerWithEmailAndPassword(email, pass);
                    },
                    child: const Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

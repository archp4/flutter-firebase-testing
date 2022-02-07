import 'package:flutter/material.dart';
import 'package:test_firebase_auth/services/auth_helper.dart';
import 'package:test_firebase_auth/views/create_operation.dart';
import 'package:test_firebase_auth/views/read_opertaion.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => AuthHelper().signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(),
        width: MediaQuery.of(context).size.width - 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CreataDataView(),
                  ),
                );
              },
              child: const Text("Create"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ReadData(),
                  ),
                );
              },
              child: const Text("Read"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}

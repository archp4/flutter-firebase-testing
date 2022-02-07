import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/services/firestore_service.dart';

class CreataDataView extends StatelessWidget {
  CreataDataView({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final companyNameController = TextEditingController();
  final designController = TextEditingController();
  final messageController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: const Text("Create New Data"),
      ),
      body: Container(
        decoration: const BoxDecoration(),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Value";
                  }
                },
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Value";
                  }
                },
                controller: companyNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Company Name",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Value";
                  }
                },
                controller: designController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Your Designation",
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Value";
                  }
                },
                controller: messageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Message",
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(),
                width: MediaQuery.of(context).size.width - 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                      await FireBaseService().addData(
                        DataModel(
                          name: nameController.text,
                          companyName: companyNameController.text,
                          designation: designController.text,
                          message: messageController.text,
                        ),
                      );
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => AlertDialog(
                          title: const Text("Data Record"),
                          content: const Text("Data Inserted Successfully"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text("Now Create New Records"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

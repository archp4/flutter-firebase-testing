import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/services/firestore_service.dart';
import 'package:test_firebase_auth/views/home.dart';

class UpdateDetails extends StatefulWidget {
  final DataModel2 dataModel;
  const UpdateDetails({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<UpdateDetails> createState() => _UpdateDetailsState();
}

class _UpdateDetailsState extends State<UpdateDetails> {
  bool updateMessage = false;
  var messageController = TextEditingController();
  var temp = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
              initialValue: widget.dataModel.name,
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Company Name",
              ),
              initialValue: widget.dataModel.companyName,
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Designation",
              ),
              initialValue: widget.dataModel.designation,
            ),
            const SizedBox(height: 20),
            TextFormField(
              readOnly: !updateMessage,
              onChanged: (val) => temp = val,
              initialValue: widget.dataModel.message,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Message",
                suffixIcon: updateMessage
                    ? IconButton(
                        onPressed: () async {
                          if (temp != widget.dataModel.name && temp != "") {
                            var result = await FireBaseService()
                                .updateData(temp, widget.dataModel.id);
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Alert"),
                                content: Text(result.toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const HomeView()),
                                      (route) => false,
                                    ),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          }
                          updateMessage = !updateMessage;
                          setState(() {});
                        },
                        icon: const Icon(Icons.done))
                    : IconButton(
                        onPressed: () {
                          updateMessage = !updateMessage;
                          setState(() {});
                        },
                        icon: const Icon(Icons.edit),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

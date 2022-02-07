import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/services/firestore_service.dart';
import 'package:test_firebase_auth/views/home.dart';
import 'package:test_firebase_auth/widgets/update_details.dart';
import 'package:test_firebase_auth/widgets/view_details.dart';

class ViewDetailPage extends StatefulWidget {
  final bool isViewOnly;
  final DataModel2 dataModel;
  final bool isDeleteable;
  const ViewDetailPage({
    Key? key,
    required this.dataModel,
    required this.isViewOnly,
    required this.isDeleteable,
  }) : super(key: key);

  @override
  State<ViewDetailPage> createState() => _ViewDetailPageState();
}

class _ViewDetailPageState extends State<ViewDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Detail"),
        actions: [
          if (widget.isDeleteable)
            IconButton(
              onPressed: () async {
                var temp =
                    await FireBaseService().deleteData(widget.dataModel.id);
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Alert"),
                    content: Text(temp),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeView()),
                          (route) => false,
                        ),
                        child: const Text("OK"),
                      )
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            )
        ],
      ),
      backgroundColor: Colors.lightBlue[100],
      body: widget.isViewOnly
          ? Container(
              height: 220,
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ViewDetails(dataModel: widget.dataModel),
            )
          : UpdateDetails(dataModel: widget.dataModel),
    );
  }
}

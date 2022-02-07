import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/widgets/update_details.dart';
import 'package:test_firebase_auth/widgets/view_details.dart';

class ViewDetailPage extends StatefulWidget {
  final bool isViewOnly;
  final DataModel2 dataModel;
  const ViewDetailPage({
    Key? key,
    required this.dataModel,
    required this.isViewOnly,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/widgets/one_row.dart';

class ViewDetails extends StatefulWidget {
  final DataModel2 dataModel;
  const ViewDetails({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        oneRow("id", widget.dataModel.id),
        oneRow("Name", widget.dataModel.name),
        oneRow("Company Name", widget.dataModel.companyName),
        oneRow("Designation", widget.dataModel.designation),
        oneRow("Message", widget.dataModel.message),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/views/view_details.dart';

class ListTileTwo extends StatefulWidget {
  final DataModel2 dataModel;
  const ListTileTwo({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<ListTileTwo> createState() => _ListTileTwoState();
}

class _ListTileTwoState extends State<ListTileTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ViewDetailPage(
              dataModel: widget.dataModel,
              isViewOnly: true,
              isDeleteable: false,
            ),
          ),
        ),
        leading: CircleAvatar(
          child: Text(widget.dataModel.name.substring(0, 1)),
        ),
        title: Text(widget.dataModel.message),
        subtitle: Text(
          widget.dataModel.name +
              " - " +
              widget.dataModel.companyName +
              ' as ' +
              widget.dataModel.designation,
        ),
      ),
    );
  }
}

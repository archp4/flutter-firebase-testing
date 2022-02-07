import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/views/view_details.dart';

class ListTileThree extends StatelessWidget {
  final DataModel2 dataModel;
  const ListTileThree({Key? key, required this.dataModel}) : super(key: key);

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
              dataModel: dataModel,
              isViewOnly: false,
            ),
          ),
        ),
        leading: CircleAvatar(
          child: Text(dataModel.name.substring(0, 1)),
        ),
        title: Text(dataModel.message),
        subtitle: Text(
          dataModel.name +
              " - " +
              dataModel.companyName +
              ' as ' +
              dataModel.designation,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';

class ListTileOne extends StatelessWidget {
  final DataModel dataModel;
  const ListTileOne({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}

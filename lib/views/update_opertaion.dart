import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/services/firestore_service.dart';
import 'package:test_firebase_auth/widgets/list_tile_three.dart';

class UpdateView extends StatefulWidget {
  const UpdateView({Key? key}) : super(key: key);

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data"),
      ),
      backgroundColor: Colors.lightBlue[100],
      body: FutureBuilder<List<DataModel2>>(
        future: FireBaseService().readData2(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              children: data.map(buildListTile3).toList(),
            );
          } else if (snapshot.hasError) {
            return Text('Something wnt wrong ! ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildListTile3(DataModel2 dataModel) {
    return ListTileThree(
      dataModel: dataModel,
      isDeleteable: false,
      isViewOnly: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_firebase_auth/models/data.dart';
import 'package:test_firebase_auth/services/firestore_service.dart';
import 'package:test_firebase_auth/widgets/list_tile_one.dart';
import 'package:test_firebase_auth/widgets/list_tile_two.dart';

class ReadData extends StatefulWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Data"),
      ),
      body: FutureBuilder<List<DataModel2>>(
        future: FireBaseService().readData2(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              children: data.map(buildListTile2).toList(),
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

  Widget buildListTile(DataModel dataModel) {
    return ListTileOne(dataModel: dataModel);
  }

  Widget buildListTile2(DataModel2 dataModel) {
    return ListTileTwo(dataModel: dataModel);
  }

  Widget futureBlrOne() {
    return FutureBuilder<List<DataModel>>(
      future: FireBaseService().readData().first,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          return ListView(
            children: data.map(buildListTile).toList(),
          );
        } else if (snapshot.hasError) {
          return Text('Something wnt wrong ! ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

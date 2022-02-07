// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_firebase_auth/models/data.dart';

class FireBaseService {
  CollectionReference data = FirebaseFirestore.instance.collection('data');
  Future<void> addData(DataModel dataModel) async {
    print("----------");
    print(dataModel.companyName);
    return await data
        .add({
          'name': dataModel.name,
          'companyName': dataModel.companyName,
          'designation': dataModel.designation,
          'message': dataModel.message,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Stream<List<DataModel>> readData() {
    return data.snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => DataModel.formJson(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList(),
        );
  }

  Future<List<DataModel2>> readData2() {
    return data
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            final json = doc.data() as Map<String, dynamic>;
            return DataModel2(
              id: doc.id,
              name: json['name'],
              companyName: json['companyName'],
              designation: json['designation'],
              message: json['message'],
            );
          }).toList(),
        )
        .first;
  }

  Future updateData(String newdata, String id) {
    return data.doc(id).update({'message': newdata}).then((value) {
      return "Data Updated Successfully Plz Revisted";
    }).catchError((error) {
      return "Failed to delete user's property: $error";
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String? documentId;
  GetUserName({this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['firstName']} ${data['lastName']}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          );
        }

        return Text("loading");
      },
    );
  }
}

// Future<UserModel?> GetUserModel(String? documentId) async {
//   final docData =
//       FirebaseFirestore.instance.collection('users').doc(documentId);
//   final snapshot = await docData.get();
//
//   if (snapshot.exists) {
//     return UserModel.fromJson(snapshot.data()!);
//   }
//   return null;
// }

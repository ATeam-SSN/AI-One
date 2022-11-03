import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Container();
//     return FutureBuilder<QuerySnapshot>(
//   future: FirebaseFirestore.instance.collection('classes').get(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasData) {
//       return Column(
//         children: snapshot.data?.docs?.map((doc) {
//           return YourWidget();
//         })?.toList() ?? [],
//       );
//     } else {
//       // or your loading widget here
//       return Container();
//     }
//   },
// );
//         return Text("loading");
//       },
//     );
  }
}

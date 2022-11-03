import 'package:cloud_firestore/cloud_firestore.dart';

class student {
  var fname, lname, dept;
  student(this.fname, this.lname, this.dept);
}

class StudentDetails {
  var username;
  StudentDetails(this.username);
  FirebaseFirestore? _instance;
  late student allDetails;
  List<dynamic> _studentDetails = [];
  List<dynamic> get_details() {
    return _studentDetails;
  }

  Future<void> get_detailsFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference studentDetails = _instance!.collection('users');

    DocumentSnapshot snapshot = await studentDetails.doc(username).get();
    var data = snapshot.data() as Map;
    allDetails = student(data['fname'], data['lname'], data['Dept']);
    print(allDetails);
  }
}

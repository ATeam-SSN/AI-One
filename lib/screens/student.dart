class Student {
  String fname, lname, dept;

  Student({required this.fname, required this.lname, required this.dept});

  factory Student.fromMap(Map<dynamic, dynamic> map) {
    String fname = map['fname'];
    String lname = map['fname'];
    String dept = map['fname'];
    return Student(fname: fname, lname: lname, dept: dept);
  }
}

import 'package:flutter/material.dart';
import 'api.dart';

class showStudents2 extends StatefulWidget {
  final String fname, lname, id;

  final Api api = Api();

  showStudents2(this.fname, this.lname, this.id);

  @override
  _showStudents2State createState() => _showStudents2State(fname, lname, id);
}

class _showStudents2State extends State<showStudents2> {
  final String fname, lname, id;

  _showStudents2State(this.fname, this.lname, this.id);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

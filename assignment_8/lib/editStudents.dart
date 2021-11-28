// ignore_for_file: use_key_in_widget_constructors
import 'main.dart';

import 'package:flutter/material.dart';

import 'api.dart';

class editStudent extends StatefulWidget {
  final String fname, lname, id;
  final Api api = Api();

  editStudent(this.fname, this.lname, this.id);

  @override
  _editStudentState createState() => _editStudentState(fname, lname, id);
}

class _editStudentState extends State<editStudent> {
  final String fname, lname, id;

  _editStudentState(this.fname, this.lname, this.id);

  void _changeStudentFname(id, fname) {
    setState(() {
      widget.api.editStudentFname(id, fname);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  TextEditingController fnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Change first name of " + widget.fname + " " + widget.lname),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: fnameController,
                    ),
                    ElevatedButton(
                        onPressed: () => {
                              _changeStudentFname(
                                  widget.id, fnameController.text),
                            },
                        child: Text("Change first name")),
                  ],
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () => {
          Navigator.pop(context),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage())),
        },
      ),
    );
  }
}

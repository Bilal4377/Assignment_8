import 'package:assignment_8/editStudents.dart';
import 'package:flutter/material.dart';

import 'api.dart';
import 'main.dart';
import 'showAllStudents.dart';

class showStudents extends StatefulWidget {
  final String courseName, id;

  final Api api = Api();

  showStudents(this.courseName, this.id);

  @override
  _showStudentsState createState() => _showStudentsState(courseName, id);
}

class _showStudentsState extends State<showStudents> {
  final String courseName, id;
  List students = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getAllStudents().then((data) {
      setState(() {
        students = data;
        _dbLoaded = true;
      });
    });
  }

  void _deleteCourse(id) {
    setState(() {
      widget.api.deleteCourse(id);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  _showStudentsState(this.courseName, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseName),
      ),
      body: Center(
          child: _dbLoaded
              ? Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _deleteCourse(widget.id),
                      child: Text("Delete Course"),
                    ),
                    Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(5.0),
                          children: [
                            ...students
                                .map<Widget>((students) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: TextButton(
                                      onPressed: () => {
                                        Navigator.pop(context),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    editStudent(
                                                        students['fname'],
                                                        students['lname'],
                                                        students['_id']))),
                                      },
                                      child: ListTile(
                                        title: Text(
                                          (students['fname'] +
                                              "  |  " +
                                              students['lname']),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    )))
                                .toList()
                          ]),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Database Loading",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    CircularProgressIndicator()
                  ],
                )),
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

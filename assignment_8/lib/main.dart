import 'package:assignment_8/main2.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'showAllCourses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Api api = Api();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List courses = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getAllCourses().then((data) {
      setState(() {
        courses = data;
        _dbLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilal App'),
      ),
      body: Center(
          child: _dbLoaded
              ? Column(
                  children: [
                    Text(
                      "Class Name | Instructor | Credits",
                      style: TextStyle(fontSize: 25),
                    ),
                    Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(5.0),
                          children: [
                            ...courses
                                .map<Widget>(
                                  (courses) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: TextButton(
                                      onPressed: () => {
                                        Navigator.pop(context),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    showStudents(
                                                        courses['courseName'],
                                                        courses['_id']))),
                                      },
                                      child: ListTile(
                                        title: Text(
                                          (courses['courseName'] +
                                              "  |  " +
                                              courses['instructorName'] +
                                              "  |  " +
                                              courses['courseCredits']
                                                  .toString()),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
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
    );
  }
}

import 'package:flutter/material.dart';

import 'api.dart';

class showCourses extends StatefulWidget {
  final String courseName, instructorName, courseCredits;

  final Api api = Api();

  showCourses(this.courseName, this.instructorName, this.courseCredits);

  @override
  _showCoursesState createState() =>
      _showCoursesState(courseName, instructorName, courseCredits);
}

class _showCoursesState extends State<showCourses> {
  final String courseName, instructorName, courseCredits;

  _showCoursesState(this.courseName, this.instructorName, this.courseCredits);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:assignment_8/editStudents.dart';
import 'package:dio/dio.dart';

import './Models/Students.dart';

import './Models/Courses.dart';

const String localhost = "http://10.0.2.2:1200/";

class Api {
  final _dio = Dio(BaseOptions(baseUrl: localhost));

  Future<List> getAllCourses() async {
    final response = await _dio.get('/getAllCourses');

    return response.data['courses'];
  }

  Future<List> getAllStudents() async {
    final response = await _dio.get('/getAllStudents');

    return response.data['students'];
  }

  Future editStudentFname(String id, String fname) async {
    final response = await _dio
        .post('/editStudentByFname', data: {'id': id, 'fname': fname});
  }

  Future deleteCourse(String id) async {
    final response = await _dio.post('/deleteCourseById', data: {'id': id});
  }
}

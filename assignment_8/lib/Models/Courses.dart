class Course {
  final String courseName;
  final String instructorName;
  final String courseCredits;

  Course._(this.instructorName, this.courseCredits, this.courseName);

  factory Course.fromJson(Map json) {
    final instructorName = json['instructorName'];
    final courseCredits = json['courseCredits'];
    final courseName = json['courseName'];

    return Course._(instructorName, courseCredits, courseName);
  }
}

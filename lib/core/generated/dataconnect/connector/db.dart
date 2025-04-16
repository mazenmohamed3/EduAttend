library default_connector;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'get_student_data.dart';

part 'list_students.dart';

part 'get_instructor.dart';

part 'list_instructors.dart';

part 'get_group.dart';

part 'list_groups.dart';

part 'get_attendance.dart';

part 'list_attendances.dart';

part 'get_subject.dart';

part 'list_subjects.dart';

part 'upsert_student.dart';

part 'upsert_instructor.dart';

part 'upsert_subject.dart';

part 'upsert_group.dart';

part 'upsert_attendance.dart';

part 'delete_student.dart';

part 'delete_instructor.dart';

part 'delete_subject.dart';

part 'delete_group.dart';

part 'delete_attendance.dart';







class DbConnector {
  
  
  GetStudentDataVariablesBuilder getStudentData () {
    return GetStudentDataVariablesBuilder(dataConnect, );
  }
  
  
  ListStudentsVariablesBuilder listStudents () {
    return ListStudentsVariablesBuilder(dataConnect, );
  }
  
  
  GetInstructorVariablesBuilder getInstructor () {
    return GetInstructorVariablesBuilder(dataConnect, );
  }
  
  
  ListInstructorsVariablesBuilder listInstructors () {
    return ListInstructorsVariablesBuilder(dataConnect, );
  }
  
  
  GetGroupVariablesBuilder getGroup () {
    return GetGroupVariablesBuilder(dataConnect, );
  }
  
  
  ListGroupsVariablesBuilder listGroups () {
    return ListGroupsVariablesBuilder(dataConnect, );
  }
  
  
  GetAttendanceVariablesBuilder getAttendance () {
    return GetAttendanceVariablesBuilder(dataConnect, );
  }
  
  
  ListAttendancesVariablesBuilder listAttendances () {
    return ListAttendancesVariablesBuilder(dataConnect, );
  }
  
  
  GetSubjectVariablesBuilder getSubject () {
    return GetSubjectVariablesBuilder(dataConnect, );
  }
  
  
  ListSubjectsVariablesBuilder listSubjects () {
    return ListSubjectsVariablesBuilder(dataConnect, );
  }
  
  
  UpsertStudentVariablesBuilder upsertStudent ({required String email, required String name, }) {
    return UpsertStudentVariablesBuilder(dataConnect, email: email,name: name,);
  }
  
  
  UpsertInstructorVariablesBuilder upsertInstructor ({required String email, required String name, }) {
    return UpsertInstructorVariablesBuilder(dataConnect, email: email,name: name,);
  }
  
  
  UpsertSubjectVariablesBuilder upsertSubject ({required String name, required String code, }) {
    return UpsertSubjectVariablesBuilder(dataConnect, name: name,code: code,);
  }
  
  
  UpsertGroupVariablesBuilder upsertGroup ({required String subjectId, required String day, required String startTime, required String endTime, }) {
    return UpsertGroupVariablesBuilder(dataConnect, subjectId: subjectId,day: day,startTime: startTime,endTime: endTime,);
  }
  
  
  UpsertAttendanceVariablesBuilder upsertAttendance ({required UpsertAttendanceVariablesStudent student, required UpsertAttendanceVariablesGroup group, required String status, }) {
    return UpsertAttendanceVariablesBuilder(dataConnect, student: student,group: group,status: status,);
  }
  
  
  DeleteStudentVariablesBuilder deleteStudent ({required String id, }) {
    return DeleteStudentVariablesBuilder(dataConnect, id: id,);
  }
  
  
  DeleteInstructorVariablesBuilder deleteInstructor ({required String id, }) {
    return DeleteInstructorVariablesBuilder(dataConnect, id: id,);
  }
  
  
  DeleteSubjectVariablesBuilder deleteSubject ({required String id, }) {
    return DeleteSubjectVariablesBuilder(dataConnect, id: id,);
  }
  
  
  DeleteGroupVariablesBuilder deleteGroup ({required String id, }) {
    return DeleteGroupVariablesBuilder(dataConnect, id: id,);
  }
  
  
  DeleteAttendanceVariablesBuilder deleteAttendance ({required String id, }) {
    return DeleteAttendanceVariablesBuilder(dataConnect, id: id,);
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-central1',
    'DB',
    'mobileappproject',
  );

  DbConnector({required this.dataConnect});
  static DbConnector get instance {
    return DbConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}


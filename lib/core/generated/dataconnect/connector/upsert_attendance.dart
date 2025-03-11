part of 'db.dart';

class UpsertAttendanceVariablesBuilder {
  UpsertAttendanceVariablesStudent student;
  UpsertAttendanceVariablesGroup group;
  String status;

  final FirebaseDataConnect _dataConnect;
  UpsertAttendanceVariablesBuilder(this._dataConnect, {required  this.student,required  this.group,required  this.status,});
  Deserializer<UpsertAttendanceData> dataDeserializer = (dynamic json)  => UpsertAttendanceData.fromJson(jsonDecode(json));
  Serializer<UpsertAttendanceVariables> varsSerializer = (UpsertAttendanceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertAttendanceData, UpsertAttendanceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertAttendanceData, UpsertAttendanceVariables> ref() {
    UpsertAttendanceVariables vars= UpsertAttendanceVariables(student: student,group: group,status: status,);
    return _dataConnect.mutation("UpsertAttendance", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertAttendanceAttendanceUpsert {
  String id;
  UpsertAttendanceAttendanceUpsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertAttendanceAttendanceUpsert({
    required this.id,
  });
}

class UpsertAttendanceData {
  UpsertAttendanceAttendanceUpsert attendance_upsert;
  UpsertAttendanceData.fromJson(dynamic json):
  attendance_upsert = UpsertAttendanceAttendanceUpsert.fromJson(json['attendance_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['attendance_upsert'] = attendance_upsert.toJson();
    return json;
  }

  UpsertAttendanceData({
    required this.attendance_upsert,
  });
}

class UpsertAttendanceVariablesStudent {
  String id;
  UpsertAttendanceVariablesStudent.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertAttendanceVariablesStudent({
    required this.id,
  });
}

class UpsertAttendanceVariablesGroup {
  String id;
  UpsertAttendanceVariablesGroup.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertAttendanceVariablesGroup({
    required this.id,
  });
}

class UpsertAttendanceVariables {
  UpsertAttendanceVariablesStudent student;
  UpsertAttendanceVariablesGroup group;
  String status;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertAttendanceVariables.fromJson(Map<String, dynamic> json):
  student = UpsertAttendanceVariablesStudent.fromJson(json['student']),group = UpsertAttendanceVariablesGroup.fromJson(json['group']),status = nativeFromJson<String>(json['status']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['student'] = student.toJson();
    json['group'] = group.toJson();
    json['status'] = nativeToJson<String>(status);
    return json;
  }

  UpsertAttendanceVariables({
    required this.student,
    required this.group,
    required this.status,
  });
}


part of 'db.dart';

class GetAttendanceVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  GetAttendanceVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }

  GetAttendanceVariablesBuilder(this._dataConnect, );
  Deserializer<GetAttendanceData> dataDeserializer = (dynamic json)  => GetAttendanceData.fromJson(jsonDecode(json));
  Serializer<GetAttendanceVariables> varsSerializer = (GetAttendanceVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetAttendanceData, GetAttendanceVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetAttendanceData, GetAttendanceVariables> ref() {
    GetAttendanceVariables vars= GetAttendanceVariables(id: _id,);
    return _dataConnect.query("GetAttendance", dataDeserializer, varsSerializer, vars);
  }
}

class GetAttendanceAttendance {
  String id;
  GetAttendanceAttendanceGroup group;
  GetAttendanceAttendanceStudent student;
  String status;
  Timestamp? attendanceDate;
  GetAttendanceAttendance.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),group = GetAttendanceAttendanceGroup.fromJson(json['group']),student = GetAttendanceAttendanceStudent.fromJson(json['student']),status = nativeFromJson<String>(json['status']),attendanceDate = json['attendanceDate'] == null ? null : Timestamp.fromJson(json['attendanceDate']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['group'] = group.toJson();
    json['student'] = student.toJson();
    json['status'] = nativeToJson<String>(status);
    if (attendanceDate != null) {
      json['attendanceDate'] = attendanceDate!.toJson();
    }
    return json;
  }

  GetAttendanceAttendance({
    required this.id,
    required this.group,
    required this.student,
    required this.status,
    this.attendanceDate,
  });
}

class GetAttendanceAttendanceGroup {
  String id;
  GetAttendanceAttendanceGroupSubject subject;
  GetAttendanceAttendanceGroup.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),subject = GetAttendanceAttendanceGroupSubject.fromJson(json['subject']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['subject'] = subject.toJson();
    return json;
  }

  GetAttendanceAttendanceGroup({
    required this.id,
    required this.subject,
  });
}

class GetAttendanceAttendanceGroupSubject {
  String name;
  GetAttendanceAttendanceGroupSubject.fromJson(dynamic json):
  name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  GetAttendanceAttendanceGroupSubject({
    required this.name,
  });
}

class GetAttendanceAttendanceStudent {
  String id;
  String name;
  GetAttendanceAttendanceStudent.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  GetAttendanceAttendanceStudent({
    required this.id,
    required this.name,
  });
}

class GetAttendanceData {
  GetAttendanceAttendance? attendance;
  GetAttendanceData.fromJson(dynamic json):
  attendance = json['attendance'] == null ? null : GetAttendanceAttendance.fromJson(json['attendance']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (attendance != null) {
      json['attendance'] = attendance!.toJson();
    }
    return json;
  }

  GetAttendanceData({
    this.attendance,
  });
}

class GetAttendanceVariables {
  late Optional<String>id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetAttendanceVariables.fromJson(Map<String, dynamic> json) {
  
    id = Optional.optional(nativeFromJson, nativeToJson);
    id.value = json['id'] == null ? null : nativeFromJson<String>(json['id']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(id.state == OptionalState.set) {
      json['id'] = id.toJson();
    }
    return json;
  }

  GetAttendanceVariables({
    required this.id,
  });
}


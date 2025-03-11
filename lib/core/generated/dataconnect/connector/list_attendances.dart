part of 'db.dart';

class ListAttendancesVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListAttendancesVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }
  ListAttendancesVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }
  ListAttendancesVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }

  ListAttendancesVariablesBuilder(this._dataConnect, );
  Deserializer<ListAttendancesData> dataDeserializer = (dynamic json)  => ListAttendancesData.fromJson(jsonDecode(json));
  Serializer<ListAttendancesVariables> varsSerializer = (ListAttendancesVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListAttendancesData, ListAttendancesVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListAttendancesData, ListAttendancesVariables> ref() {
    ListAttendancesVariables vars= ListAttendancesVariables(id: _id,offset: _offset,limit: _limit,);
    return _dataConnect.query("ListAttendances", dataDeserializer, varsSerializer, vars);
  }
}

class ListAttendancesAttendances {
  String id;
  ListAttendancesAttendancesGroup group;
  ListAttendancesAttendancesStudent student;
  String status;
  Timestamp? attendanceDate;
  ListAttendancesAttendances.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),group = ListAttendancesAttendancesGroup.fromJson(json['group']),student = ListAttendancesAttendancesStudent.fromJson(json['student']),status = nativeFromJson<String>(json['status']),attendanceDate = json['attendanceDate'] == null ? null : Timestamp.fromJson(json['attendanceDate']);

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

  ListAttendancesAttendances({
    required this.id,
    required this.group,
    required this.student,
    required this.status,
    this.attendanceDate,
  });
}

class ListAttendancesAttendancesGroup {
  String id;
  ListAttendancesAttendancesGroupSubject subject;
  ListAttendancesAttendancesGroup.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),subject = ListAttendancesAttendancesGroupSubject.fromJson(json['subject']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['subject'] = subject.toJson();
    return json;
  }

  ListAttendancesAttendancesGroup({
    required this.id,
    required this.subject,
  });
}

class ListAttendancesAttendancesGroupSubject {
  String name;
  ListAttendancesAttendancesGroupSubject.fromJson(dynamic json):
  name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  ListAttendancesAttendancesGroupSubject({
    required this.name,
  });
}

class ListAttendancesAttendancesStudent {
  String id;
  String name;
  ListAttendancesAttendancesStudent.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  ListAttendancesAttendancesStudent({
    required this.id,
    required this.name,
  });
}

class ListAttendancesData {
  List<ListAttendancesAttendances> attendances;
  ListAttendancesData.fromJson(dynamic json):
  attendances = (json['attendances'] as List<dynamic>)
        .map((e) => ListAttendancesAttendances.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['attendances'] = attendances.map((e) => e.toJson()).toList();
    return json;
  }

  ListAttendancesData({
    required this.attendances,
  });
}

class ListAttendancesVariables {
  late Optional<String>id;
  late Optional<int>offset;
  late Optional<int>limit;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListAttendancesVariables.fromJson(Map<String, dynamic> json) {
  
    id = Optional.optional(nativeFromJson, nativeToJson);
    id.value = json['id'] == null ? null : nativeFromJson<String>(json['id']);
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(id.state == OptionalState.set) {
      json['id'] = id.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    return json;
  }

  ListAttendancesVariables({
    required this.id,
    required this.offset,
    required this.limit,
  });
}


part of 'db.dart';

class UpsertGroupVariablesBuilder {
  String subjectId;
  Optional<String> _studentId = Optional.optional(nativeFromJson, nativeToJson);
  String day;
  String startTime;
  String endTime;

  final FirebaseDataConnect _dataConnect;  UpsertGroupVariablesBuilder studentId(String? t) {
   _studentId.value = t;
   return this;
  }

  UpsertGroupVariablesBuilder(this._dataConnect, {required  this.subjectId,required  this.day,required  this.startTime,required  this.endTime,});
  Deserializer<UpsertGroupData> dataDeserializer = (dynamic json)  => UpsertGroupData.fromJson(jsonDecode(json));
  Serializer<UpsertGroupVariables> varsSerializer = (UpsertGroupVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertGroupData, UpsertGroupVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertGroupData, UpsertGroupVariables> ref() {
    UpsertGroupVariables vars= UpsertGroupVariables(subjectId: subjectId,studentId: _studentId,day: day,startTime: startTime,endTime: endTime,);
    return _dataConnect.mutation("UpsertGroup", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertGroupGroupUpsert {
  String id;
  UpsertGroupGroupUpsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertGroupGroupUpsert({
    required this.id,
  });
}

class UpsertGroupData {
  UpsertGroupGroupUpsert group_upsert;
  UpsertGroupData.fromJson(dynamic json):
  group_upsert = UpsertGroupGroupUpsert.fromJson(json['group_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['group_upsert'] = group_upsert.toJson();
    return json;
  }

  UpsertGroupData({
    required this.group_upsert,
  });
}

class UpsertGroupVariables {
  String subjectId;
  late Optional<String>studentId;
  String day;
  String startTime;
  String endTime;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertGroupVariables.fromJson(Map<String, dynamic> json):
  subjectId = nativeFromJson<String>(json['subjectId']),day = nativeFromJson<String>(json['day']),startTime = nativeFromJson<String>(json['startTime']),endTime = nativeFromJson<String>(json['endTime']) {
  
    studentId = Optional.optional(nativeFromJson, nativeToJson);
    studentId.value = json['studentId'] == null ? null : nativeFromJson<String>(json['studentId']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['subjectId'] = nativeToJson<String>(subjectId);
    if(studentId.state == OptionalState.set) {
      json['studentId'] = studentId.toJson();
    }
    json['day'] = nativeToJson<String>(day);
    json['startTime'] = nativeToJson<String>(startTime);
    json['endTime'] = nativeToJson<String>(endTime);
    return json;
  }

  UpsertGroupVariables({
    required this.subjectId,
    required this.studentId,
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}


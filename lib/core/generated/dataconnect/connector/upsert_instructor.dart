part of 'db.dart';

class UpsertInstructorVariablesBuilder {
  String email;
  String name;

  final FirebaseDataConnect _dataConnect;
  UpsertInstructorVariablesBuilder(this._dataConnect, {required  this.email,required  this.name,});
  Deserializer<UpsertInstructorData> dataDeserializer = (dynamic json)  => UpsertInstructorData.fromJson(jsonDecode(json));
  Serializer<UpsertInstructorVariables> varsSerializer = (UpsertInstructorVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertInstructorData, UpsertInstructorVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertInstructorData, UpsertInstructorVariables> ref() {
    UpsertInstructorVariables vars= UpsertInstructorVariables(email: email,name: name,);
    return _dataConnect.mutation("UpsertInstructor", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertInstructorInstructorUpsert {
  String id;
  UpsertInstructorInstructorUpsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertInstructorInstructorUpsert({
    required this.id,
  });
}

class UpsertInstructorData {
  UpsertInstructorInstructorUpsert instructor_upsert;
  UpsertInstructorData.fromJson(dynamic json):
  instructor_upsert = UpsertInstructorInstructorUpsert.fromJson(json['instructor_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['instructor_upsert'] = instructor_upsert.toJson();
    return json;
  }

  UpsertInstructorData({
    required this.instructor_upsert,
  });
}

class UpsertInstructorVariables {
  String email;
  String name;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertInstructorVariables.fromJson(Map<String, dynamic> json):
  email = nativeFromJson<String>(json['email']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  UpsertInstructorVariables({
    required this.email,
    required this.name,
  });
}


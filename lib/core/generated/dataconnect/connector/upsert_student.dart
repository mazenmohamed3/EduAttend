part of 'db.dart';

class UpsertStudentVariablesBuilder {
  String email;
  String name;

  final FirebaseDataConnect _dataConnect;
  UpsertStudentVariablesBuilder(this._dataConnect, {required  this.email,required  this.name,});
  Deserializer<UpsertStudentData> dataDeserializer = (dynamic json)  => UpsertStudentData.fromJson(jsonDecode(json));
  Serializer<UpsertStudentVariables> varsSerializer = (UpsertStudentVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertStudentData, UpsertStudentVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertStudentData, UpsertStudentVariables> ref() {
    UpsertStudentVariables vars= UpsertStudentVariables(email: email,name: name,);
    return _dataConnect.mutation("UpsertStudent", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertStudentStudentUpsert {
  String id;
  UpsertStudentStudentUpsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertStudentStudentUpsert({
    required this.id,
  });
}

class UpsertStudentData {
  UpsertStudentStudentUpsert student_upsert;
  UpsertStudentData.fromJson(dynamic json):
  student_upsert = UpsertStudentStudentUpsert.fromJson(json['student_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['student_upsert'] = student_upsert.toJson();
    return json;
  }

  UpsertStudentData({
    required this.student_upsert,
  });
}

class UpsertStudentVariables {
  String email;
  String name;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertStudentVariables.fromJson(Map<String, dynamic> json):
  email = nativeFromJson<String>(json['email']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['email'] = nativeToJson<String>(email);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  UpsertStudentVariables({
    required this.email,
    required this.name,
  });
}


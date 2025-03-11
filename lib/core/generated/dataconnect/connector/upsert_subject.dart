part of 'db.dart';

class UpsertSubjectVariablesBuilder {
  String name;
  String code;

  final FirebaseDataConnect _dataConnect;
  UpsertSubjectVariablesBuilder(this._dataConnect, {required  this.name,required  this.code,});
  Deserializer<UpsertSubjectData> dataDeserializer = (dynamic json)  => UpsertSubjectData.fromJson(jsonDecode(json));
  Serializer<UpsertSubjectVariables> varsSerializer = (UpsertSubjectVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpsertSubjectData, UpsertSubjectVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpsertSubjectData, UpsertSubjectVariables> ref() {
    UpsertSubjectVariables vars= UpsertSubjectVariables(name: name,code: code,);
    return _dataConnect.mutation("UpsertSubject", dataDeserializer, varsSerializer, vars);
  }
}

class UpsertSubjectSubjectUpsert {
  String id;
  UpsertSubjectSubjectUpsert.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpsertSubjectSubjectUpsert({
    required this.id,
  });
}

class UpsertSubjectData {
  UpsertSubjectSubjectUpsert subject_upsert;
  UpsertSubjectData.fromJson(dynamic json):
  subject_upsert = UpsertSubjectSubjectUpsert.fromJson(json['subject_upsert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['subject_upsert'] = subject_upsert.toJson();
    return json;
  }

  UpsertSubjectData({
    required this.subject_upsert,
  });
}

class UpsertSubjectVariables {
  String name;
  String code;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpsertSubjectVariables.fromJson(Map<String, dynamic> json):
  name = nativeFromJson<String>(json['name']),code = nativeFromJson<String>(json['code']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['name'] = nativeToJson<String>(name);
    json['code'] = nativeToJson<String>(code);
    return json;
  }

  UpsertSubjectVariables({
    required this.name,
    required this.code,
  });
}


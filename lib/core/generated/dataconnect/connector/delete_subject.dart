part of 'db.dart';

class DeleteSubjectVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteSubjectVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteSubjectData> dataDeserializer = (dynamic json)  => DeleteSubjectData.fromJson(jsonDecode(json));
  Serializer<DeleteSubjectVariables> varsSerializer = (DeleteSubjectVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteSubjectData, DeleteSubjectVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteSubjectData, DeleteSubjectVariables> ref() {
    DeleteSubjectVariables vars= DeleteSubjectVariables(id: id,);
    return _dataConnect.mutation("DeleteSubject", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteSubjectSubjectDelete {
  String id;
  DeleteSubjectSubjectDelete.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteSubjectSubjectDelete({
    required this.id,
  });
}

class DeleteSubjectData {
  DeleteSubjectSubjectDelete? subject_delete;
  DeleteSubjectData.fromJson(dynamic json):
  subject_delete = json['subject_delete'] == null ? null : DeleteSubjectSubjectDelete.fromJson(json['subject_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (subject_delete != null) {
      json['subject_delete'] = subject_delete!.toJson();
    }
    return json;
  }

  DeleteSubjectData({
    this.subject_delete,
  });
}

class DeleteSubjectVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteSubjectVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteSubjectVariables({
    required this.id,
  });
}


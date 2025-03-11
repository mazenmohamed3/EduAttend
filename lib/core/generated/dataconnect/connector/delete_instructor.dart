part of 'db.dart';

class DeleteInstructorVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteInstructorVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteInstructorData> dataDeserializer = (dynamic json)  => DeleteInstructorData.fromJson(jsonDecode(json));
  Serializer<DeleteInstructorVariables> varsSerializer = (DeleteInstructorVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteInstructorData, DeleteInstructorVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteInstructorData, DeleteInstructorVariables> ref() {
    DeleteInstructorVariables vars= DeleteInstructorVariables(id: id,);
    return _dataConnect.mutation("DeleteInstructor", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteInstructorInstructorDelete {
  String id;
  DeleteInstructorInstructorDelete.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteInstructorInstructorDelete({
    required this.id,
  });
}

class DeleteInstructorData {
  DeleteInstructorInstructorDelete? instructor_delete;
  DeleteInstructorData.fromJson(dynamic json):
  instructor_delete = json['instructor_delete'] == null ? null : DeleteInstructorInstructorDelete.fromJson(json['instructor_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (instructor_delete != null) {
      json['instructor_delete'] = instructor_delete!.toJson();
    }
    return json;
  }

  DeleteInstructorData({
    this.instructor_delete,
  });
}

class DeleteInstructorVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteInstructorVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteInstructorVariables({
    required this.id,
  });
}


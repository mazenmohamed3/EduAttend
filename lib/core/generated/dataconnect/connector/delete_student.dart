part of 'db.dart';

class DeleteStudentVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteStudentVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteStudentData> dataDeserializer = (dynamic json)  => DeleteStudentData.fromJson(jsonDecode(json));
  Serializer<DeleteStudentVariables> varsSerializer = (DeleteStudentVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteStudentData, DeleteStudentVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteStudentData, DeleteStudentVariables> ref() {
    DeleteStudentVariables vars= DeleteStudentVariables(id: id,);
    return _dataConnect.mutation("DeleteStudent", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteStudentStudentDelete {
  String id;
  DeleteStudentStudentDelete.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteStudentStudentDelete({
    required this.id,
  });
}

class DeleteStudentData {
  DeleteStudentStudentDelete? student_delete;
  DeleteStudentData.fromJson(dynamic json):
  student_delete = json['student_delete'] == null ? null : DeleteStudentStudentDelete.fromJson(json['student_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (student_delete != null) {
      json['student_delete'] = student_delete!.toJson();
    }
    return json;
  }

  DeleteStudentData({
    this.student_delete,
  });
}

class DeleteStudentVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteStudentVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteStudentVariables({
    required this.id,
  });
}


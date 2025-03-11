part of 'db.dart';

class DeleteGroupVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteGroupVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteGroupData> dataDeserializer = (dynamic json)  => DeleteGroupData.fromJson(jsonDecode(json));
  Serializer<DeleteGroupVariables> varsSerializer = (DeleteGroupVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteGroupData, DeleteGroupVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteGroupData, DeleteGroupVariables> ref() {
    DeleteGroupVariables vars= DeleteGroupVariables(id: id,);
    return _dataConnect.mutation("DeleteGroup", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteGroupGroupDelete {
  String id;
  DeleteGroupGroupDelete.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteGroupGroupDelete({
    required this.id,
  });
}

class DeleteGroupData {
  DeleteGroupGroupDelete? group_delete;
  DeleteGroupData.fromJson(dynamic json):
  group_delete = json['group_delete'] == null ? null : DeleteGroupGroupDelete.fromJson(json['group_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (group_delete != null) {
      json['group_delete'] = group_delete!.toJson();
    }
    return json;
  }

  DeleteGroupData({
    this.group_delete,
  });
}

class DeleteGroupVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteGroupVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteGroupVariables({
    required this.id,
  });
}


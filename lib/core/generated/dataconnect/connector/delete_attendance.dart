part of 'db.dart';

class DeleteAttendanceVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  DeleteAttendanceVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<DeleteAttendanceData> dataDeserializer = (dynamic json)  => DeleteAttendanceData.fromJson(jsonDecode(json));
  Serializer<DeleteAttendanceVariables> varsSerializer = (DeleteAttendanceVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<DeleteAttendanceData, DeleteAttendanceVariables>> execute() {
    return ref().execute();
  }

  MutationRef<DeleteAttendanceData, DeleteAttendanceVariables> ref() {
    DeleteAttendanceVariables vars= DeleteAttendanceVariables(id: id,);
    return _dataConnect.mutation("DeleteAttendance", dataDeserializer, varsSerializer, vars);
  }
}

class DeleteAttendanceAttendanceDelete {
  String id;
  DeleteAttendanceAttendanceDelete.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteAttendanceAttendanceDelete({
    required this.id,
  });
}

class DeleteAttendanceData {
  DeleteAttendanceAttendanceDelete? attendance_delete;
  DeleteAttendanceData.fromJson(dynamic json):
  attendance_delete = json['attendance_delete'] == null ? null : DeleteAttendanceAttendanceDelete.fromJson(json['attendance_delete']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (attendance_delete != null) {
      json['attendance_delete'] = attendance_delete!.toJson();
    }
    return json;
  }

  DeleteAttendanceData({
    this.attendance_delete,
  });
}

class DeleteAttendanceVariables {
  String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  DeleteAttendanceVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  DeleteAttendanceVariables({
    required this.id,
  });
}


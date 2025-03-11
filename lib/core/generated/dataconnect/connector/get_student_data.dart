part of 'db.dart';

class GetStudentDataVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetStudentDataVariablesBuilder(this._dataConnect, );
  Deserializer<GetStudentDataData> dataDeserializer = (dynamic json)  => GetStudentDataData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetStudentDataData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetStudentDataData, void> ref() {
    
    return _dataConnect.query("GetStudentData", dataDeserializer, emptySerializer, null);
  }
}

class GetStudentDataStudent {
  String id;
  String email;
  String name;
  GetStudentDataStudent.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),email = nativeFromJson<String>(json['email']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['email'] = nativeToJson<String>(email);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  GetStudentDataStudent({
    required this.id,
    required this.email,
    required this.name,
  });
}

class GetStudentDataData {
  GetStudentDataStudent? student;
  GetStudentDataData.fromJson(dynamic json):
  student = json['student'] == null ? null : GetStudentDataStudent.fromJson(json['student']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (student != null) {
      json['student'] = student!.toJson();
    }
    return json;
  }

  GetStudentDataData({
    this.student,
  });
}


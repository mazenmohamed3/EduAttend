part of 'db.dart';

class GetInstructorVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetInstructorVariablesBuilder(this._dataConnect, );
  Deserializer<GetInstructorData> dataDeserializer = (dynamic json)  => GetInstructorData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetInstructorData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetInstructorData, void> ref() {
    
    return _dataConnect.query("GetInstructor", dataDeserializer, emptySerializer, null);
  }
}

class GetInstructorInstructor {
  String id;
  String email;
  String name;
  GetInstructorInstructor.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),email = nativeFromJson<String>(json['email']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['email'] = nativeToJson<String>(email);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  GetInstructorInstructor({
    required this.id,
    required this.email,
    required this.name,
  });
}

class GetInstructorData {
  GetInstructorInstructor? instructor;
  GetInstructorData.fromJson(dynamic json):
  instructor = json['instructor'] == null ? null : GetInstructorInstructor.fromJson(json['instructor']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (instructor != null) {
      json['instructor'] = instructor!.toJson();
    }
    return json;
  }

  GetInstructorData({
    this.instructor,
  });
}


part of 'db.dart';

class GetSubjectVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  GetSubjectVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }

  GetSubjectVariablesBuilder(this._dataConnect, );
  Deserializer<GetSubjectData> dataDeserializer = (dynamic json)  => GetSubjectData.fromJson(jsonDecode(json));
  Serializer<GetSubjectVariables> varsSerializer = (GetSubjectVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetSubjectData, GetSubjectVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetSubjectData, GetSubjectVariables> ref() {
    GetSubjectVariables vars= GetSubjectVariables(id: _id,);
    return _dataConnect.query("GetSubject", dataDeserializer, varsSerializer, vars);
  }
}

class GetSubjectSubject {
  String id;
  String name;
  String subjectCode;
  GetSubjectSubjectTeachedBy teachedBy;
  GetSubjectSubject.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),subjectCode = nativeFromJson<String>(json['subjectCode']),teachedBy = GetSubjectSubjectTeachedBy.fromJson(json['teachedBy']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['subjectCode'] = nativeToJson<String>(subjectCode);
    json['teachedBy'] = teachedBy.toJson();
    return json;
  }

  GetSubjectSubject({
    required this.id,
    required this.name,
    required this.subjectCode,
    required this.teachedBy,
  });
}

class GetSubjectSubjectTeachedBy {
  String id;
  String name;
  GetSubjectSubjectTeachedBy.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  GetSubjectSubjectTeachedBy({
    required this.id,
    required this.name,
  });
}

class GetSubjectData {
  GetSubjectSubject? subject;
  GetSubjectData.fromJson(dynamic json):
  subject = json['subject'] == null ? null : GetSubjectSubject.fromJson(json['subject']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (subject != null) {
      json['subject'] = subject!.toJson();
    }
    return json;
  }

  GetSubjectData({
    this.subject,
  });
}

class GetSubjectVariables {
  late Optional<String>id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetSubjectVariables.fromJson(Map<String, dynamic> json) {
  
    id = Optional.optional(nativeFromJson, nativeToJson);
    id.value = json['id'] == null ? null : nativeFromJson<String>(json['id']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(id.state == OptionalState.set) {
      json['id'] = id.toJson();
    }
    return json;
  }

  GetSubjectVariables({
    required this.id,
  });
}


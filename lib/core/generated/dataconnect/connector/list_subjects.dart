part of 'db.dart';

class ListSubjectsVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListSubjectsVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }
  ListSubjectsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }
  ListSubjectsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }

  ListSubjectsVariablesBuilder(this._dataConnect, );
  Deserializer<ListSubjectsData> dataDeserializer = (dynamic json)  => ListSubjectsData.fromJson(jsonDecode(json));
  Serializer<ListSubjectsVariables> varsSerializer = (ListSubjectsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListSubjectsData, ListSubjectsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListSubjectsData, ListSubjectsVariables> ref() {
    ListSubjectsVariables vars= ListSubjectsVariables(id: _id,offset: _offset,limit: _limit,);
    return _dataConnect.query("ListSubjects", dataDeserializer, varsSerializer, vars);
  }
}

class ListSubjectsSubjects {
  String id;
  String name;
  String subjectCode;
  ListSubjectsSubjectsTeachedBy teachedBy;
  ListSubjectsSubjects.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']),subjectCode = nativeFromJson<String>(json['subjectCode']),teachedBy = ListSubjectsSubjectsTeachedBy.fromJson(json['teachedBy']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['subjectCode'] = nativeToJson<String>(subjectCode);
    json['teachedBy'] = teachedBy.toJson();
    return json;
  }

  ListSubjectsSubjects({
    required this.id,
    required this.name,
    required this.subjectCode,
    required this.teachedBy,
  });
}

class ListSubjectsSubjectsTeachedBy {
  String id;
  String name;
  ListSubjectsSubjectsTeachedBy.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  ListSubjectsSubjectsTeachedBy({
    required this.id,
    required this.name,
  });
}

class ListSubjectsData {
  List<ListSubjectsSubjects> subjects;
  ListSubjectsData.fromJson(dynamic json):
  subjects = (json['subjects'] as List<dynamic>)
        .map((e) => ListSubjectsSubjects.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['subjects'] = subjects.map((e) => e.toJson()).toList();
    return json;
  }

  ListSubjectsData({
    required this.subjects,
  });
}

class ListSubjectsVariables {
  late Optional<String>id;
  late Optional<int>offset;
  late Optional<int>limit;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListSubjectsVariables.fromJson(Map<String, dynamic> json) {
  
    id = Optional.optional(nativeFromJson, nativeToJson);
    id.value = json['id'] == null ? null : nativeFromJson<String>(json['id']);
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(id.state == OptionalState.set) {
      json['id'] = id.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    return json;
  }

  ListSubjectsVariables({
    required this.id,
    required this.offset,
    required this.limit,
  });
}


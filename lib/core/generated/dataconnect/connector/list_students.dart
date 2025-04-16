part of 'db.dart';

class ListStudentsVariablesBuilder {
  Optional<String> _email = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListStudentsVariablesBuilder email(String? t) {
   _email.value = t;
   return this;
  }
  ListStudentsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }
  ListStudentsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }

  ListStudentsVariablesBuilder(this._dataConnect, );
  Deserializer<ListStudentsData> dataDeserializer = (dynamic json)  => ListStudentsData.fromJson(jsonDecode(json));
  Serializer<ListStudentsVariables> varsSerializer = (ListStudentsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListStudentsData, ListStudentsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListStudentsData, ListStudentsVariables> ref() {
    ListStudentsVariables vars= ListStudentsVariables(email: _email,offset: _offset,limit: _limit,);
    return _dataConnect.query("ListStudents", dataDeserializer, varsSerializer, vars);
  }
}

class ListStudentsStudents {
  String id;
  String email;
  String name;
  ListStudentsStudents.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),email = nativeFromJson<String>(json['email']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['email'] = nativeToJson<String>(email);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  ListStudentsStudents({
    required this.id,
    required this.email,
    required this.name,
  });
}

class ListStudentsData {
  List<ListStudentsStudents> students;
  ListStudentsData.fromJson(dynamic json):
  students = (json['students'] as List<dynamic>)
        .map((e) => ListStudentsStudents.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['students'] = students.map((e) => e.toJson()).toList();
    return json;
  }

  ListStudentsData({
    required this.students,
  });
}

class ListStudentsVariables {
  late Optional<String>email;
  late Optional<int>offset;
  late Optional<int>limit;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListStudentsVariables.fromJson(Map<String, dynamic> json) {
  
    email = Optional.optional(nativeFromJson, nativeToJson);
    email.value = json['email'] == null ? null : nativeFromJson<String>(json['email']);
  
    offset = Optional.optional(nativeFromJson, nativeToJson);
    offset.value = json['offset'] == null ? null : nativeFromJson<int>(json['offset']);
  
    limit = Optional.optional(nativeFromJson, nativeToJson);
    limit.value = json['limit'] == null ? null : nativeFromJson<int>(json['limit']);
  
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if(email.state == OptionalState.set) {
      json['email'] = email.toJson();
    }
    if(offset.state == OptionalState.set) {
      json['offset'] = offset.toJson();
    }
    if(limit.state == OptionalState.set) {
      json['limit'] = limit.toJson();
    }
    return json;
  }

  ListStudentsVariables({
    required this.email,
    required this.offset,
    required this.limit,
  });
}


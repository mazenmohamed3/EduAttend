part of 'db.dart';

class ListInstructorsVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListInstructorsVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }
  ListInstructorsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }
  ListInstructorsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }

  ListInstructorsVariablesBuilder(this._dataConnect, );
  Deserializer<ListInstructorsData> dataDeserializer = (dynamic json)  => ListInstructorsData.fromJson(jsonDecode(json));
  Serializer<ListInstructorsVariables> varsSerializer = (ListInstructorsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListInstructorsData, ListInstructorsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListInstructorsData, ListInstructorsVariables> ref() {
    ListInstructorsVariables vars= ListInstructorsVariables(id: _id,offset: _offset,limit: _limit,);
    return _dataConnect.query("ListInstructors", dataDeserializer, varsSerializer, vars);
  }
}

class ListInstructorsInstructors {
  String id;
  String email;
  String name;
  ListInstructorsInstructors.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),email = nativeFromJson<String>(json['email']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['email'] = nativeToJson<String>(email);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  ListInstructorsInstructors({
    required this.id,
    required this.email,
    required this.name,
  });
}

class ListInstructorsData {
  List<ListInstructorsInstructors> instructors;
  ListInstructorsData.fromJson(dynamic json):
  instructors = (json['instructors'] as List<dynamic>)
        .map((e) => ListInstructorsInstructors.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['instructors'] = instructors.map((e) => e.toJson()).toList();
    return json;
  }

  ListInstructorsData({
    required this.instructors,
  });
}

class ListInstructorsVariables {
  late Optional<String>id;
  late Optional<int>offset;
  late Optional<int>limit;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListInstructorsVariables.fromJson(Map<String, dynamic> json) {
  
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

  ListInstructorsVariables({
    required this.id,
    required this.offset,
    required this.limit,
  });
}


part of 'db.dart';

class ListGroupsVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _offset = Optional.optional(nativeFromJson, nativeToJson);
  Optional<int> _limit = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  ListGroupsVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }
  ListGroupsVariablesBuilder offset(int? t) {
   _offset.value = t;
   return this;
  }
  ListGroupsVariablesBuilder limit(int? t) {
   _limit.value = t;
   return this;
  }

  ListGroupsVariablesBuilder(this._dataConnect, );
  Deserializer<ListGroupsData> dataDeserializer = (dynamic json)  => ListGroupsData.fromJson(jsonDecode(json));
  Serializer<ListGroupsVariables> varsSerializer = (ListGroupsVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<ListGroupsData, ListGroupsVariables>> execute() {
    return ref().execute();
  }

  QueryRef<ListGroupsData, ListGroupsVariables> ref() {
    ListGroupsVariables vars= ListGroupsVariables(id: _id,offset: _offset,limit: _limit,);
    return _dataConnect.query("ListGroups", dataDeserializer, varsSerializer, vars);
  }
}

class ListGroupsGroups {
  String id;
  ListGroupsGroupsSubject subject;
  String day;
  String startTime;
  String endTime;
  ListGroupsGroups.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),subject = ListGroupsGroupsSubject.fromJson(json['subject']),day = nativeFromJson<String>(json['day']),startTime = nativeFromJson<String>(json['startTime']),endTime = nativeFromJson<String>(json['endTime']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['subject'] = subject.toJson();
    json['day'] = nativeToJson<String>(day);
    json['startTime'] = nativeToJson<String>(startTime);
    json['endTime'] = nativeToJson<String>(endTime);
    return json;
  }

  ListGroupsGroups({
    required this.id,
    required this.subject,
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}

class ListGroupsGroupsSubject {
  String id;
  String name;
  ListGroupsGroupsSubject.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  ListGroupsGroupsSubject({
    required this.id,
    required this.name,
  });
}

class ListGroupsData {
  List<ListGroupsGroups> groups;
  ListGroupsData.fromJson(dynamic json):
  groups = (json['groups'] as List<dynamic>)
        .map((e) => ListGroupsGroups.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['groups'] = groups.map((e) => e.toJson()).toList();
    return json;
  }

  ListGroupsData({
    required this.groups,
  });
}

class ListGroupsVariables {
  late Optional<String>id;
  late Optional<int>offset;
  late Optional<int>limit;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  ListGroupsVariables.fromJson(Map<String, dynamic> json) {
  
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

  ListGroupsVariables({
    required this.id,
    required this.offset,
    required this.limit,
  });
}


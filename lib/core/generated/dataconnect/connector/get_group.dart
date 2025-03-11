part of 'db.dart';

class GetGroupVariablesBuilder {
  Optional<String> _id = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;
  GetGroupVariablesBuilder id(String? t) {
   _id.value = t;
   return this;
  }

  GetGroupVariablesBuilder(this._dataConnect, );
  Deserializer<GetGroupData> dataDeserializer = (dynamic json)  => GetGroupData.fromJson(jsonDecode(json));
  Serializer<GetGroupVariables> varsSerializer = (GetGroupVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetGroupData, GetGroupVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetGroupData, GetGroupVariables> ref() {
    GetGroupVariables vars= GetGroupVariables(id: _id,);
    return _dataConnect.query("GetGroup", dataDeserializer, varsSerializer, vars);
  }
}

class GetGroupGroup {
  String id;
  GetGroupGroupSubject subject;
  String day;
  String startTime;
  String endTime;
  GetGroupGroup.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),subject = GetGroupGroupSubject.fromJson(json['subject']),day = nativeFromJson<String>(json['day']),startTime = nativeFromJson<String>(json['startTime']),endTime = nativeFromJson<String>(json['endTime']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['subject'] = subject.toJson();
    json['day'] = nativeToJson<String>(day);
    json['startTime'] = nativeToJson<String>(startTime);
    json['endTime'] = nativeToJson<String>(endTime);
    return json;
  }

  GetGroupGroup({
    required this.id,
    required this.subject,
    required this.day,
    required this.startTime,
    required this.endTime,
  });
}

class GetGroupGroupSubject {
  String id;
  String name;
  GetGroupGroupSubject.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),name = nativeFromJson<String>(json['name']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  GetGroupGroupSubject({
    required this.id,
    required this.name,
  });
}

class GetGroupData {
  GetGroupGroup? group;
  GetGroupData.fromJson(dynamic json):
  group = json['group'] == null ? null : GetGroupGroup.fromJson(json['group']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (group != null) {
      json['group'] = group!.toJson();
    }
    return json;
  }

  GetGroupData({
    this.group,
  });
}

class GetGroupVariables {
  late Optional<String>id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetGroupVariables.fromJson(Map<String, dynamic> json) {
  
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

  GetGroupVariables({
    required this.id,
  });
}


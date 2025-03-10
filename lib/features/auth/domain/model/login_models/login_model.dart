class LoginModel {
  Data? data;

  LoginModel({this.data});

  // From JSON (Factory Constructor)
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  // To JSON (Method)
  Map<String, dynamic> toJson() {
    return {'data': data?.toJson()};
  }
}

class Data {
  String? username;
  int? id;
  List<String>? subjects;

  Data({this.username, this.id, this.subjects});

  // From JSON (Factory Constructor)
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      id: json['id'],
      subjects: json['subjects'] != null ? List<String>.from(json['subjects']) : null,
    );
  }

  // To JSON (Method)
  Map<String, dynamic> toJson() {
    return {'username': username, 'id': id, 'subjects': subjects};
  }
}

import 'package:cryptokeep/utils/encryption.dart';
import 'package:uuid/uuid.dart';

class Login {
  String id, username, password, category, title, createdAt, updatedAt;
  int favorite;

  Login(
      {id,
      name,
      username,
      password,
      favorite = 1,
      category = "Login",
      createdAt,
      updatedAt}) {
    this.id = id ?? Uuid().v4().toString();
    this.title = name;
    this.username = username;
    this.password = password;
    this.favorite = favorite;
    this.category = category;
    this.createdAt = createdAt ?? DateTime.now().toIso8601String();
    this.updatedAt = updatedAt ?? DateTime.now().toIso8601String();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "_id": this.id,
      "title": this.title,
      "username": this.username,
      "password": this.password,
      "favorite": this.favorite,
      "category": this.category,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt
    };
    return map;
  }

  Login.fromMap(Map<String, dynamic> map, {decryptPassword = false}) {
    id = map["_id"];
    title = map["title"];
    username = map["username"];
    password = decryptPassword
        ? EncryptionService().decrypt(map["password"])
        : map["password"];
    favorite = map["favorite"];
    category = map["category"];
    createdAt = map["createdAt"];
    updatedAt = map["updatedAt"];
  }

  /// Create object with essentials only ///
  static Login fromValue(Map<String, dynamic> map) {
    return Login(
      name: map["title"],
      username: map["username"],
      password: map["password"],
      // favorite: map["favorite"],
      category: map["category"],
    );
  }

  void update(Map<String, dynamic> value) {
    this.title = value["title"];
    this.username = value["username"];
    this.password = value["password"];
  }
}

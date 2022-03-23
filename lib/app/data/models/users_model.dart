//
import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.uid,
    this.name,
    this.phoneNumber,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.keahlian,
    this.rating,
    this.umur,
    this.role,
    this.updatedTime,
    this.chats,
  });

  String? uid;
  String? name;

  String? email;
  String? phoneNumber;
  String? photoUrl;
  List? keahlian;
  String? umur;
  double? rating;
  // List<String>? keahlian;
  String? role;
  String? creationTime;
  String? lastSignInTime;
  String? updatedTime;
  List<ChatUser>? chats;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        uid: json["uid"],
        name: json["name"],

        email: json["email"],
        phoneNumber: json["phoneNumber"],
        photoUrl: json["photoUrl"],
        keahlian: json["keahlian"],
        umur: json["umur"],
        rating: json["rating"],
        // keahlian: List<String>.from(json["keahlian"].map((x) => x)),
        role: json["role"],
        creationTime: (json["creationTime"]),
        lastSignInTime: (json["lastSignInTime"]),
        updatedTime: (json["updatedTime"]),
        // chats:
        //     List<ChatUser>.from(json["chats"].map((x) => ChatUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,

        "email": email,
        "phoneNumber": phoneNumber,
        // "keahlian": keahlian,
        "keahlian": List<dynamic>.from(keahlian!.map((x) => x)),
        "umur": umur,
        "rating": rating,
        "role": role,
        "photoUrl": photoUrl,
        "creationTime": creationTime,
        "lastSignInTime": lastSignInTime,
        "updatedTime": updatedTime,
        // "chats": List<dynamic>.from(chats!.map((x) => x.toJson())),
      };
}

class ChatUser {
  ChatUser({
    this.connection,
    this.chatId,
    this.lastTime,
    this.total_unread,
  });

  String? connection;
  String? chatId;
  String? lastTime;
  int? total_unread;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
        connection: json["connection"],
        chatId: json["chat_id"],
        lastTime: json["lastTime"],
        total_unread: json["total_unread"],
      );

  Map<String, dynamic> toJson() => {
        "connection": connection,
        "chat_id": chatId,
        "lastTime": lastTime,
        "total_unread": total_unread,
      };
}

// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);




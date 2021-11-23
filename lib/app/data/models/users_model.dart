//
import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.keahlian,
    this.creationTime,
    this.lastSignInTime,
    this.updatedTime,
    this.chats,
  });

  String? uid;
  String? name;

  String? email;
  String? phoneNumber;
  String? photoUrl;
  List? keahlian;
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
        "keahlian": keahlian,
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

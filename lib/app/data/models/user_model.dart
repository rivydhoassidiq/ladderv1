class UserModel {
  String? uid;
  String? name;
  String? phoneNumber;
  String? email;
  String? creationTime;
  String? lastSignInTime;
  String? photoUrl;
  String? updateTime;

  UserModel(
      {this.uid,
      this.name,
      this.phoneNumber,
      this.email,
      this.creationTime,
      this.lastSignInTime,
      this.photoUrl,
      this.updateTime});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    photoUrl = json['photoUrl'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['photoUrl'] = photoUrl;
    data['updateTime'] = updateTime;
    return data;
  }
}

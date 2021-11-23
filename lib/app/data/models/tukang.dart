class TukangModel {
  String? name;
  String? email;
  List? keahlian;
  String? photoUrl;

  TukangModel({
    this.name,
    this.email,
    this.keahlian,
    this.photoUrl,
  });

  TukangModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    keahlian = json['keahlian'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['keahlian'] = keahlian;
    data['photoUrl'] = photoUrl;

    return data;
  }
}
// class TukangModel {
//   static const NAME = "name";
//   static const EMAIL = "email";
//   static const KEAHLIAN = "keahlian";
//   static const PHOTOURL = "photoUrl";

//   String? name;
//   String? email;
//   String? keahlian;
//   String? photoUrl;

//   TukangModel({
//     this.name,
//     this.email,
//     this.keahlian,
//     this.photoUrl,
//   });

//   TukangModel.fromMap(Map<String, dynamic> data) {
//     name = data[NAME];
//     email = data[EMAIL];
//     keahlian = data[KEAHLIAN];
//     photoUrl = data[PHOTOURL];
//   }
// }

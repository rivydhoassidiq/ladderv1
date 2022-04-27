class Ratings {
  String? id;
  String? photoUrl;
  String? name;
  double? ratingg;
  String? komen;

  Ratings({
    this.id,
    this.photoUrl,
    this.name,
    this.ratingg,
    this.komen,
  });

  Ratings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoUrl = json["photoUrl"];
    name = json["name"];
    ratingg = json["rating"];
    komen = json["komen"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['photoUrl'] = photoUrl;
    data['name'] = name;
    data['rating'] = ratingg;
    data['komen'] = komen;

    return data;
  }
}

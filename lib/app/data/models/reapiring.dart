class RepairingModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const DESCRIPTION = "description";

  String? id;
  String? image;
  String? name;
  String? description;

  RepairingModel({
    this.id,
    this.image,
    this.name,
    this.description,
  });

  RepairingModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    description = data[DESCRIPTION];
  }
}

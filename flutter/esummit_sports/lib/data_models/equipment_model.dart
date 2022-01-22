class EquipmentModel {
  int id;
  String? name;
  bool? toBuy;
  String? address;
  String? description;
  double? cost;
  String? coverImg;

  EquipmentModel({
    required this.id,
    this.address,
    this.cost,
    this.coverImg,
    this.description,
    this.name,
    this.toBuy,
  });

  factory EquipmentModel.fromJson(Map json) {
    return EquipmentModel(
      id: json['id'],
      name: json['name'],
      toBuy: json['toBuy'],
      address: json['address'],
      description: json['description'],
      cost: json['cost'],
      coverImg: json['coverImg'],
    );
  }
}

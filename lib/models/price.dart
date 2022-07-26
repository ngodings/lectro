class PricePacket {
  int? id;
  String? name;
  String? description;
  String? perKwh;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdUser;
  String? updatedUser;

  PricePacket(
      {this.id,
      this.name,
      this.description,
      this.perKwh,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdUser,
      this.updatedUser});

  PricePacket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    perKwh = json['per_kwh'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdUser = json['created_user'];
    updatedUser = json['updated_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['per_kwh'] = perKwh;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_user'] = createdUser;
    data['updated_user'] = updatedUser;
    return data;
  }
}

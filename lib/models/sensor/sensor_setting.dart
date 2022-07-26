class DeviceSensorSetting {
  int? id;
  String? type;
  String? serial;
  String? name;
  String? shortDescription;
  String? description;
  String? address;
  String? latitude;
  String? longitude;
  String? photo;
  int? loopDelay;
  int? debug;
  String? lastOnline;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdUser;
  String? updatedUser;

  DeviceSensorSetting(
      {this.id,
      this.type,
      this.serial,
      this.name,
      this.shortDescription,
      this.description,
      this.address,
      this.latitude,
      this.longitude,
      this.photo,
      this.loopDelay,
      this.debug,
      this.lastOnline,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdUser,
      this.updatedUser});

  DeviceSensorSetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    serial = json['serial'];
    name = json['name'];
    shortDescription = json['short_description'];
    description = json['description'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    photo = json['photo'];
    loopDelay = json['loop_delay'];
    debug = json['debug'];
    lastOnline = json['last_online'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdUser = json['created_user'];
    updatedUser = json['updated_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['serial'] = serial;
    data['name'] = name;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['photo'] = photo;
    data['loop_delay'] = loopDelay;
    data['debug'] = debug;
    data['last_online'] = lastOnline;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_user'] = createdUser;
    data['updated_user'] = updatedUser;
    return data;
  }
}

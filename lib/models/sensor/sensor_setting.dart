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

class SensorSetting {
  int? deviceId;
  int? autoControl;
  int? controlRelay;
  int? pauseMonitoring;
  String? currentMin;
  String? currentMax;
  String? voltageMin;
  String? voltageMax;
  String? frequencyMin;
  String? frequencyMax;
  String? powerTotalMin;
  String? powerTotalMax;
  String? powerActiveMin;
  String? powerActiveMax;
  String? energyMin;
  String? energyMax;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdUser;
  String? updatedUser;

  SensorSetting(
      {this.deviceId,
      this.autoControl,
      this.controlRelay,
      this.pauseMonitoring,
      this.currentMin,
      this.currentMax,
      this.voltageMin,
      this.voltageMax,
      this.frequencyMin,
      this.frequencyMax,
      this.powerTotalMin,
      this.powerTotalMax,
      this.powerActiveMin,
      this.powerActiveMax,
      this.energyMin,
      this.energyMax,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdUser,
      this.updatedUser});

  SensorSetting.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
    autoControl = json['auto_control'];
    controlRelay = json['control_relay'];
    pauseMonitoring = json['pause_monitoring'];
    currentMin = json['current_min'];
    currentMax = json['current_max'];
    voltageMin = json['voltage_min'];
    voltageMax = json['voltage_max'];
    frequencyMin = json['frequency_min'];
    frequencyMax = json['frequency_max'];
    powerTotalMin = json['power_total_min'];
    powerTotalMax = json['power_total_max'];
    powerActiveMin = json['power_active_min'];
    powerActiveMax = json['power_active_max'];
    energyMin = json['energy_min'];
    energyMax = json['energy_max'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdUser = json['created_user'];
    updatedUser = json['updated_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_id'] = deviceId;
    data['auto_control'] = autoControl;
    data['control_relay'] = controlRelay;
    data['pause_monitoring'] = pauseMonitoring;
    data['current_min'] = currentMin;
    data['current_max'] = currentMax;
    data['voltage_min'] = voltageMin;
    data['voltage_max'] = voltageMax;
    data['frequency_min'] = frequencyMin;
    data['frequency_max'] = frequencyMax;
    data['power_total_min'] = powerTotalMin;
    data['power_total_max'] = powerTotalMax;
    data['power_active_min'] = powerActiveMin;
    data['power_active_max'] = powerActiveMax;
    data['energy_min'] = energyMin;
    data['energy_max'] = energyMax;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_user'] = createdUser;
    data['updated_user'] = updatedUser;
    return data;
  }
}

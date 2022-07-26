class DataSensor {
  String? id;
  int? deviceId;
  String? current;
  String? voltage;
  String? frequency;
  String? powerFactor;
  String? powerTotal;
  String? powerActive;
  String? energy;
  int? status;
  String? createdAt;
  String? updatedAt;

  DataSensor(
      {this.id,
      this.deviceId,
      this.current,
      this.voltage,
      this.frequency,
      this.powerFactor,
      this.powerTotal,
      this.powerActive,
      this.energy,
      this.status,
      this.createdAt,
      this.updatedAt});

  DataSensor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    current = json['current'];
    voltage = json['voltage'];
    frequency = json['frequency'];
    powerFactor = json['power_factor'];
    powerTotal = json['power_total'];
    powerActive = json['power_active'];
    energy = json['energy'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['device_id'] = deviceId;
    data['current'] = current;
    data['voltage'] = voltage;
    data['frequency'] = frequency;
    data['power_factor'] = powerFactor;
    data['power_total'] = powerTotal;
    data['power_active'] = powerActive;
    data['energy'] = energy;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

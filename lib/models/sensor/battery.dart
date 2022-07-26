class Battery {
  String? id;
  int? deviceId;
  String? currentPositive;
  String? currentNegative;
  String? voltage;
  String? power;
  String? energy;
  String? soc;
  String? temperature1;
  String? temperature2;
  String? temperature3;
  int? errorCode;
  String? errorMessage;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? createdUser;
  String? updatedUser;

  Battery(
      {this.id,
      this.deviceId,
      this.currentPositive,
      this.currentNegative,
      this.voltage,
      this.power,
      this.energy,
      this.soc,
      this.temperature1,
      this.temperature2,
      this.temperature3,
      this.errorCode,
      this.errorMessage,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.createdUser,
      this.updatedUser});

  Battery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    currentPositive = json['current_positive'];
    currentNegative = json['current_negative'];
    voltage = json['voltage'];
    power = json['power'];
    energy = json['energy'];
    soc = json['soc'];
    temperature1 = json['temperature_1'];
    temperature2 = json['temperature_2'];
    temperature3 = json['temperature_3'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdUser = json['created_user'];
    updatedUser = json['updated_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['device_id'] = deviceId;
    data['current_positive'] = currentPositive;
    data['current_negative'] = currentNegative;
    data['voltage'] = voltage;
    data['power'] = power;
    data['energy'] = energy;
    data['soc'] = soc;
    data['temperature_1'] = temperature1;
    data['temperature_2'] = temperature2;
    data['temperature_3'] = temperature3;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_user'] = createdUser;
    data['updated_user'] = updatedUser;
    return data;
  }
}

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:lectro/models/sensor/sensor_setting.dart';
import 'package:lectro/utils/api.dart';

import '../models/base_response.dart';
import '../utils/constant.dart';

class PriorityRepository extends BaseRepository {
  final _storage = GetStorage();
  Future<BaseResponse> getPriorityData() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      lastPriorityData,
      queryParams: {'device': idDevice},
    );

    if (res.statusCode == 200) {
      final user = DataSensor.fromJson(res.data['records'][0]);
      var energyPrio = user.energy.toString();
      _storage.write(lastEnergyPriority, energyPrio);
      // GetIt.I<FlutterSecureStorage>()
      //     .write(key: lastEnergyPriority, value: energyPrio);
      return BaseResponse(
        statusCode: res.statusCode,
        data: user,
      );
    }
    return res;
  }

  Future<BaseResponse> getSettingPriorityR() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      viewSettingPriority,
      queryParams: {
        'device': idDevice,
      },
    );

    if (res.statusCode == 200) {
      final priority = SensorSetting.fromJson(res.data['sensor_setting']);

      return BaseResponse(
        statusCode: res.statusCode,
        data: priority,
        message: res.message,
      );
    }
    return res;
  }

  Future<BaseResponse> getValueSettingPriorityR() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      viewSettingPriority,
      queryParams: {
        'device': idDevice,
      },
    );

    if (res.statusCode == 200) {
      final priority = res.data['sensor_setting'];

      return BaseResponse(
        statusCode: res.statusCode,
        data: priority,
        message: res.message,
      );
    }
    return res;
  }

  Future<BaseResponse> updateSettingPriorityR(String relay) async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }
    final res = await put(
      updateSettingPriority,
      data: {
        'control_relay': relay,
      },
      queryParameters: {'device': idDevice},
    );

    if (res.statusCode == 200) {
      return BaseResponse(
        statusCode: res.statusCode,
        data: res,
        message: res.message,
      );
    }
    return res;
  }

  // not used
  Future<String> getEnergyPriority() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      lastPriorityData,
      queryParams: {'device': idDevice},
    );

    if (res.statusCode == 200) {
      final user = DataSensor.fromJson(res.data['records'][0]);
      var energyPrio = user.energy.toString();
      _storage.write(lastEnergyPriority, energyPrio);
      // GetIt.I<FlutterSecureStorage>()
      //     .write(key: lastEnergyPriority, value: energyPrio);
      return energyPrio.toString();
    }
    return '0';
  }
}

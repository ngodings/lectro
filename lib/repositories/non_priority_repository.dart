import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:lectro/utils/api.dart';
import 'package:lectro/utils/constant.dart';

import '../models/sensor/sensor_setting.dart';

class NonPriorityRepository extends BaseRepository {
  final _storage = GetStorage();
  Future<BaseResponse> getEnergyNonPriority() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);

    final res =
        await fetch(lastNonPriorityData, queryParams: {'device': idDevice});

    if (res.statusCode == 200) {
      final sensor = DataSensor.fromJson(res.data['records'][0]);
      var energyNonPrio = sensor.energy.toString();
      _storage.write(lastEnergyNonPriority, energyNonPrio);
      // GetIt.I<FlutterSecureStorage>()
      //     .write(key: lastEnergyNonPriority, value: energyNonPrio);
      return BaseResponse(
        statusCode: res.statusCode,
        data: sensor,
      );
    }
    return res;
  }

  Future<BaseResponse> getSettingNonPriorityR() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      viewSettingNonPriority,
      queryParams: {
        'device': idDevice,
      },
    );

    if (res.statusCode == 200) {
      final nonPriority =
          DeviceSensorSetting.fromJson(res.data['sensor_setting']);

      return BaseResponse(
        statusCode: res.statusCode,
        data: nonPriority,
        message: res.message,
      );
    }
    return res;
  }

  Future<BaseResponse> updateSettingNonPriorityR(int relay) async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }
    final res = await put(
      updateSettingNonPriority,
      data: {
        'control_relay': relay,
      },
      queryParameters: {
        'device': idDevice,
      },
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

  Stream<BaseResponse> refreshNonPrioData() async* {
    while (true) {
      var refreshData = await getEnergyNonPriority();
      yield refreshData;
    }
  }
}

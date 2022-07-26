import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
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

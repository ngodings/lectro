import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/sensor/battery.dart';
import 'package:lectro/utils/api.dart';

import '../utils/constant.dart';

class BatteryRepository extends BaseRepository {
  final _storage = GetStorage();
  Future<BaseResponse> getBatteryData() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(lastBatteryData, queryParams: {
      'bms_device': idDevice,
    });

    if (res.statusCode == 200) {
      final user = Battery.fromJson(res.data['records'][0]);
      var energyBattery = user.energy.toString();
      _storage.write(lastEnergyBattery, energyBattery);
      // GetIt.I<FlutterSecureStorage>()
      //     .write(key: lastEnergyBattery, value: energyBattery);

      return BaseResponse(
        statusCode: res.statusCode,
        data: user,
      );
    }
    return res;
  }
}

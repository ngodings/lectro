import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lectro/models/sensor/data_sensor.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

class GridRepository extends BaseRepository {
  final _storage = GetStorage();
  Future<BaseResponse> getGridData() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      lastGridData,
      queryParams: {'device': idDevice},
    );

    if (res.statusCode == 200) {
      final user = DataSensor.fromJson(res.data['records'][0]);
      var energyGrid = user.energy.toString();
      _storage.write(lastEnergyGrid, energyGrid);
      // GetIt.I<FlutterSecureStorage>()
      //     .write(key: lastEnergyGrid, value: energyGrid);

      return BaseResponse(
        statusCode: res.statusCode,
        data: user,
      );
    }
    return res;
  }

  Future<DataSensor> getRecordGrid() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      lastGridData,
      queryParams: {'device': idDevice},
    );

    if (res.statusCode == 200) {
      final user = DataSensor.fromJson(res.data['records'][0]);
      var energyGrid = user.energy.toString();
      _storage.write(lastEnergyGrid, energyGrid);
      // GetIt.I<FlutterSecureStorage>()
      //     .write(key: lastEnergyGrid, value: energyGrid);

      return user;
    }
    return DataSensor.fromJson(res.data['records']);
  }

  Stream<BaseResponse> getRefreshData() async* {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(
      lastGridData,
      queryParams: {'device': idDevice},
    );

    if (res.statusCode == 200) {
      final user = DataSensor.fromJson(res.data['records'][0]);
      var energyGrid = user.energy.toString();
      GetIt.I<FlutterSecureStorage>()
          .write(key: lastEnergyGrid, value: energyGrid);

      yield BaseResponse(
        statusCode: res.statusCode,
        data: user,
      );
    }
    yield res;
  }
}

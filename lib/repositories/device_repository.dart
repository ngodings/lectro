import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/device/is_online.dart';
import 'package:lectro/utils/api.dart';
import 'package:lectro/utils/constant.dart';

class DeviceRepository extends BaseRepository {
  Future<BaseResponse> getIsOnlineData() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);

    final res = await fetch(
      isOnlineDevice,
      queryParams: {'id': idDevice},
    );

    if (res.statusCode == 200) {
      final isOnline = DeviceStatus.fromJson(res.data);
      return BaseResponse(statusCode: res.statusCode, data: isOnline);
    }
    return res;
  }

  Future<List> getListDeviceData() async {
    final res = await fetching(profilUrl);
    return res['data']['access_devices'];
  }
}

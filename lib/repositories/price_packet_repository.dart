import 'package:flutter/foundation.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/price.dart';
import 'package:lectro/utils/api.dart';
import 'package:lectro/utils/constant.dart';

import '../helper/base_repository.dart';

class PricePacketRepository extends BaseRepository {
  Future<BaseResponse> getPricePacketData() async {
    var idDevice = await secureStorage.read(key: clientDeviceId);
    if (kDebugMode) {
      print(idDevice);
    }

    final res = await fetch(indexPacket, queryParams: {
      'device': idDevice,
    });

    if (res.statusCode == 200) {
      final packet = PricePacket.fromJson(res.data['items'][0]);
      return BaseResponse(
        statusCode: res.statusCode,
        data: packet,
      );
    }
    return res;
  }
}

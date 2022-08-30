import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/utils/api.dart';

class UserRepository extends BaseRepository {
  Future<BaseResponse> getUserData() async {
    final res = await fetch(profilUrl);

    if (res.statusCode == 200) {
      final profile = DataUser.fromJson(res.data['user']);

      return BaseResponse(statusCode: res.statusCode, data: profile);
    }
    return res;
  }

  Future<BaseResponse> completeProfile(String username, address, phone) async {
    final res = await put(
      updateProfile,
      data: {
        'username': username,
        'address': address,
        'phone': phone,
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

  Future<BaseResponse> editProfile(
      String username, address, phone, fullName, about) async {
    final res = await put(
      updateProfile,
      data: {
        'username': username,
        'full_name': fullName,
        'address': address,
        'phone': phone,
        'about': about
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
}

import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/utils/api.dart';

class UserRepository extends BaseRepository {
  Future<BaseResponse> getUserData() async {
    final res = await fetch(profilUrl);

    if (res.statusCode == 200) {
      final profile = User.fromJson(res.data['user']);

      return BaseResponse(statusCode: res.statusCode, data: profile);
    }
    return res;
  }
}

import '../helper/base_repository.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookRepository extends BaseRepository {
  final facebook = FacebookAuth.instance;
  AccessToken? token;
  Future loginWithFacebook() async {
    token = await FacebookAuth.instance.accessToken;
    print(token!.toJson());
    _login();

    if (token != null) {
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
    } else {
      _login();
    }
    final res = await getFb(
      token.toString(),
      queryParams: {
        'fields': 'name,first_name,last_name,email',
        'access_token': token
      },
    );
    print(res);
    return res;
  }

  _login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      token = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
    } else {
      print(result.status);
      print(result.message);
    }
  }
}

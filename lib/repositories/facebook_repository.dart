import '../helper/base_repository.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookRepository extends BaseRepository {
  final facebook = FacebookAuth.instance;
  AccessToken? token;

  Future loginWithFB() async {
    bool isLogged = await facebook.accessToken != null;
    AccessToken? token = await facebook.accessToken;
    final userData = await FacebookAuth.instance.getUserData();
    print(facebook.accessToken);
    if (!isLogged) {
      LoginResult result = await facebook.login();
      if (result.status == LoginStatus.success) {
        return userData;
      }
    } else {
      Map<String, dynamic> user = await FacebookAuth.instance.getUserData();

      return user;
    }
  }

  Future<Map<String, dynamic>> loginWithFacebook() async {
    token = await FacebookAuth.instance.accessToken;

    print(token!.toJson());
    _login();
    Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
    if (token != null) {
      print(userData);
      return userData;
    } else {}
    final res = await getFb(
      token.toString(),
      queryParams: {
        'fields': 'name,first_name,last_name,email',
        'access_token': token
      },
    );
    print(res);
    return userData;
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

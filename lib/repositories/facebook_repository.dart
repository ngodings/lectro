import 'package:get_it/get_it.dart';

import '../helper/base_repository.dart';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../models/base_response.dart';
import '../models/user.dart';
import '../services/navigation.dart';
import '../services/user_service.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

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

  Future<BaseResponse> signUpFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    token = await FacebookAuth.instance.accessToken;
    token = result.accessToken;

    Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
    if (token != null) {
      final response = await signup(
        signUpSocmed,
        data: {
          'source': 'facebook',
          'id': userData['id'],
          'email': userData['email'],
          'username': 'userltr$randomNumber',
          'full_name': userData['name'],
        },
      );
      if (response.statusCode == 200) {
        final user = DataUser.fromJson(response.data);

        GetIt.I<UserService>().setUser = user;
        GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
        return BaseResponse(
          statusCode: response.statusCode,
          data: response,
          message: response.message,
        );
      } else {
        GetIt.I<NavigationServiceMain>().pushReplacementNamed('/register');
        return BaseResponse(
          statusCode: response.statusCode,
          data: response,
          message: response.message,
        );
      }
    }
    return userData['email'];
  }

  Future<BaseResponse> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    token = await FacebookAuth.instance.accessToken;
    token = result.accessToken;

    Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
    if (token != null) {
      print(userData);
      return userData['email'];
    }
    return userData['name'];
  }
}

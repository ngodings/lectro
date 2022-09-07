import 'package:flutter/foundation.dart';
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

  Future<BaseResponse> signInFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    token = await FacebookAuth.instance.accessToken;
    token = result.accessToken;
    Map<String, dynamic> userData = await FacebookAuth.instance.getUserData();
    if (token != null) {
      final response = await login(signInSocmed, data: {
        'source': 'facebook',
        'id': userData['id'],
        'email': userData['email'],
      });

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
      if (kDebugMode) {
        print(userData);
      }
      return userData['email'];
    }
    return userData['name'];
  }
}

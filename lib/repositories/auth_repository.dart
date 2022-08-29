import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lectro/helper/base_repository.dart';
import 'package:lectro/models/base_response.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/services/navigation.dart';
import 'package:lectro/services/user_service.dart';
import 'package:lectro/utils/api.dart';
import 'package:lectro/utils/constant.dart';

class AuthRepository extends BaseRepository {
  Future<BaseResponse> loginUser(String username, String password) async {
    final res = await login(
      loginUrl,
      data: {
        'username': username,
        'password': password,
      },
    );

    if (res.statusCode == 200) {
      final user = DataUser.fromJson(res.data);

      GetIt.I<UserService>().setUser = user;
      GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
      return BaseResponse(
        statusCode: res.statusCode,
        data: user,
        message: res.message,
      );
    } else {
      return BaseResponse(
        statusCode: res.statusCode,
        data: res.data[0],
        message: res.message,
      );
    }
  }

  Future<BaseResponse> registerBasic(
    String fullname,
    username,
    email,
    password,
    rePassword,
    address,
    phone,
  ) async {
    final response = await register(
      registerUrl,
      data: {
        'full_name': fullname,
        'username': username,
        'email': email,
        'password': password,
        'repeat_password': rePassword,
        'address': address,
        'phone': phone,
      },
    );
    if (response.statusCode == 200) {
      final user = ResponseSignUp.fromJson(response.data);

      return BaseResponse(
        statusCode: response.statusCode,
        data: user,
        message: response.message,
      );
    } else {
      return BaseResponse(
        statusCode: response.statusCode,
        data: response,
        message: response.message,
      );
    }
  }

  Future<BaseResponse> requestCode(String username) async {
    final response = await register(
      resendVerifEmail,
      data: {'username': username},
    );
    if (response.statusCode == 200) {
      final user = ResponseSignUp.fromJson(response.data);
      final timestamp = user.timestamp ?? '0';
      GetIt.I<FlutterSecureStorage>()
          .write(key: clientTimestamp, value: timestamp.toString());

      return BaseResponse(
        statusCode: response.statusCode,
        data: user,
        message: response.message,
      );
    } else {
      return BaseResponse(
        statusCode: response.statusCode,
        data: response,
        message: response.message,
      );
    }
  }

  Future<BaseResponse> registerCodeEmail(String code, int timestamp) async {
    final res = await fetchSignUp(
      verifyEmail,
      queryParams: {
        'token': code,
        'timestamp': timestamp,
      },
    );
    if (res.statusCode == 200) {
      final user = DataUser.fromJson(res.data);

      GetIt.I<UserService>().setUser = user;
      GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
      return BaseResponse(
        statusCode: res.statusCode,
        data: user,
        message: res.message,
      );
    } else {
      return BaseResponse(
        statusCode: res.statusCode,
        data: res,
        message: res.message,
      );
    }
  }

  Future<BaseResponse> setFCM() async {
    final firebaseMsg = GetIt.I<FirebaseMessaging>();
    final fcmToken = await firebaseMsg.getToken(
        vapidKey:
            'BCQHBRR1kGFnHFQ4hFhgqLnP6lAOGv8DDENfvGsGASfSGTrIKQchfcCQWAFcAdaQqwDIA9yaPGerCdpBRuathrU');
    final response = await post(
      apiFCMToken,
      data: {'fcm_token': fcmToken},
    );
    return response;
  }

  void signOut() async {
    await GoogleSignIn().signOut();
    //await FacebookAuth.instance.logOut();
    await GetIt.I<FlutterSecureStorage>().deleteAll();
    await GetIt.I<NavigationServiceMain>().pushRemoveUntil('/login');
  }
}

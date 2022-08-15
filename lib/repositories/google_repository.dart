import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:math';

import '../helper/base_repository.dart';
import '../models/base_response.dart';
import '../models/user.dart';
import '../services/navigation.dart';
import '../services/user_service.dart';
import '../utils/api.dart';
import '../utils/constant.dart';

class GoogleRepository extends BaseRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  // ignore: unused_field
  late final User _user;

  Future<BaseResponse> loginWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    print(googleSignInAccount);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential authResult = await _auth.signInWithCredential(credential);
    _user = authResult.user!;
    print("User Access Token: ${googleSignInAuthentication.accessToken}");
    final res = await login(
      loginGoogle,
      data: {
        'id_token': googleSignInAuthentication.idToken,
      },
    );

    if (res.statusCode == 200) {
      //final user = User.fromJson(res.data);

      // GetIt.I<UserService>().setUser = ;
      GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
      return BaseResponse(
        statusCode: res.statusCode,
        data: res,
      );
    }
    return res;
  }

  Future<BaseResponse> signUpGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential authResult = await _auth.signInWithCredential(credential);
    _user = authResult.user!;
    final response = await signup(
      signUpSocmed,
      data: {
        'source': 'google',
        'id': googleSignInAccount.id,
        'email': googleSignInAccount.email,
        'username': 'userltr$randomNumber',
        'full_name': googleSignInAccount.displayName,
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

  Future<BaseResponse> signInGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    UserCredential authResult = await _auth.signInWithCredential(credential);
    _user = authResult.user!;
    final res = await login(
      loginGoogle,
      data: {
        'source': 'google',
        'id': googleSignInAccount.id,
        'email': googleSignInAccount.email,
      },
    );

    if (res.statusCode == 200) {
      final user = DataUser.fromJson(res.data);

      GetIt.I<UserService>().setUser = user;
      GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
      return BaseResponse(
        statusCode: res.statusCode,
        data: res,
      );
    }
    return res;
  }
}

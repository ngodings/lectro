import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../helper/base_repository.dart';
import '../models/base_response.dart';
import '../services/navigation.dart';
import '../utils/api.dart';

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
}

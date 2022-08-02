import 'package:bloc/bloc.dart';
import 'package:lectro/repositories/auth_repository.dart';
import 'package:lectro/repositories/google_repository.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final _repo = AuthRepository();
  final _google = GoogleRepository();

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    final response = await _repo.loginUser(username, password);

    if (response.statusCode == 200) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailed(
        response.message,
      ));
    }
  }

  Future<void> loginGoogle() async {
    emit(LoginLoading());
    final res = await _google.loginWithGoogle();
    print(res);

    if (res.statusCode == 200) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailed(
        res.message,
      ));
    }
  }
}

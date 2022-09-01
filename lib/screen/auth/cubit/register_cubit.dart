import 'package:bloc/bloc.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/repositories/auth_repository.dart';
import 'package:lectro/repositories/facebook_repository.dart';
import 'package:lectro/repositories/google_repository.dart';
import 'package:lectro/utils/alert_toast.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _auth = AuthRepository();
  final _google = GoogleRepository();
  final _facebook = FacebookRepository();

  Future<void> registerBasic(
    String fullname,
    username,
    email,
    password,
    rePassword,
    address,
    phone,
  ) async {
    emit(RegisterLoading());
    final res = await _auth.registerBasic(
        fullname, username, email, password, rePassword, address, phone);
    if (res.statusCode == 200) {
      emit(RegisterResponseSuccess(res.data));
      showToastSuccess('Success!');
    } else {
      emit(RegisterFailed(res.message));
      showToastError('Please Try Again!');
    }
  }

  Future<void> registerCodeEmail(String code, int timestamp) async {
    emit(RegisterLoading());
    final res = await _auth.registerCodeEmail(code, timestamp);
    if (res.statusCode == 200) {
      emit(RegisterResponseSuccess(res.data));
      showToastSuccess('Success!');
    } else {
      emit(RegisterFailed(res.message));
      showToastError('Please Try Again!');
    }
  }

  Future<void> requestCodeEmail(String username) async {
    emit(RegisterLoading());
    final res = await _auth.requestCode(username);
    if (res.statusCode == 200) {
      emit(RegisterSuccess());
      showToastSuccess('Success!');
    } else {
      emit(RegisterFailed(res.message));
      showToastError('Please Try Again!');
    }
  }

  Future<void> signUpWithGoogle() async {
    emit(RegisterLoading());
    final res = await _google.signUpGoogle();

    if (res.statusCode == 200) {
      emit(RegisterSuccess());
      showToastSuccess('Success!');
    } else {
      emit(RegisterFailed(res.message));
      showToastError('Please Try Again!');
    }
  }

  Future<void> signUpWithFacebook() async {
    emit(RegisterLoading());
    final res = await _facebook.signUpFacebook();

    if (res.statusCode == 200) {
      emit(RegisterSuccess());
      showToastSuccess('Success!');
    } else {
      emit(RegisterFailed(res.message));
      showToastError('Please Try Again!');
    }
  }
}

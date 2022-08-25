import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit() : super(ValidatorInitial());

  void validateAll(String email, name, password, username, rePassword) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    emit(ValidateAll(emailRegex.hasMatch(email), name.isNotEmpty,
        username.isNotEmpty, password.length > 6, password == rePassword));
  }

  void validateOnLogin(String email, username, password) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    emit(ValidateOnLogin(
        emailRegex.hasMatch(email), username.isNotEmpty, password.isNotEmpty));
  }

  void validateEmail(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    emit(ValidateEmail(emailRegex.hasMatch(email)));
  }

  void validatePassword(String password) {
    emit(ValidatePassword(password.length > 6));
  }

  void validateRePassword(String password, String rePassword) {
    emit(ValidateRePassword(password == rePassword));
  }

  void changeButtonState(bool value) {
    emit(ChangeButtonState(value));
  }
}

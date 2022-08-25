part of 'validator_cubit.dart';

@immutable
abstract class ValidatorState {}

class ValidatorInitial extends ValidatorState {}

class ValidateEmail extends ValidatorState {
  final bool validateEmail;

  ValidateEmail(this.validateEmail);
}

class ValidateAll extends ValidatorState {
  final bool validateEmail;
  final bool validateName;
  final bool validateUsername;
  final bool validatePassword;
  final bool validateRePassword;

  ValidateAll(
    this.validateEmail,
    this.validateName,
    this.validatePassword,
    this.validateRePassword,
    this.validateUsername,
  );
}

class ValidateOnLogin extends ValidatorState {
  final bool validateUsername;
  final bool validateEmail;
  final bool validatePassword;

  ValidateOnLogin(
    this.validateEmail,
    this.validateUsername,
    this.validatePassword,
  );
}

class ValidatePassword extends ValidatorState {
  final bool validatePassword;
  ValidatePassword(this.validatePassword);
}

class ValidateRePassword extends ValidatorState {
  final bool validateRePassword;
  ValidateRePassword(this.validateRePassword);
}

class ChangeButtonState extends ValidatorState {
  final bool buttonState;
  ChangeButtonState(this.buttonState);
}

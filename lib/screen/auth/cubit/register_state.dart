part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterResponseSuccess extends RegisterState {
  final ResponseSignUp response;
  RegisterResponseSuccess(this.response);
}

class RegisterFailed extends RegisterState {
  final String? errors;

  RegisterFailed(this.errors);
}

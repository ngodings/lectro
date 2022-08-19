part of 'register_code_cubit.dart';

@immutable
abstract class RegisterCodeState {}

class RegisterCodeInitial extends RegisterCodeState {}

class RegisterCodeLoading extends RegisterCodeState {}

class RegisterCodeSuccess extends RegisterCodeState {}

class RegisterCodeFailed extends RegisterCodeState {
  final String message;

  RegisterCodeFailed(this.message);
}

class RegisterCodeTimersEnd extends RegisterCodeState {}

class RegisterCodeTimersStart extends RegisterCodeState {}

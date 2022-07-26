part of 'show_password_cubit.dart';

@immutable
abstract class ShowPasswordState {}

class ShowPasswordInitial extends ShowPasswordState {}

class ChangeObscure extends ShowPasswordState {
  final bool value;
  ChangeObscure(this.value);
}

part of 'radio_button_cubit.dart';

@immutable
abstract class RadioButtonState {}

class RadioButtonInitial extends RadioButtonState {}

class RadioButtonSwitch extends RadioButtonState {
  final bool switchC;

  RadioButtonSwitch(this.switchC);
}

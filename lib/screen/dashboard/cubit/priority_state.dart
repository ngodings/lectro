part of 'priority_cubit.dart';

@immutable
abstract class PriorityState {}

class PriorityInitial extends PriorityState {}

class PriorityLoading extends PriorityState {}

class PrioritySuccess extends PriorityState {
  final DataSensor priority;
  PrioritySuccess(this.priority);
}

class SettingPrioritySuccess extends PriorityState {
  final SensorSetting priority;
  SettingPrioritySuccess(this.priority);
}

class ValuePrioritySuccess extends PriorityState {
  final bool value;
  ValuePrioritySuccess(this.value);
}

class PrioritySuccessMessage extends PriorityState {
  final String msg;
  PrioritySuccessMessage(this.msg);
}

class PriorityFailed extends PriorityState {
  final String errors;
  PriorityFailed(this.errors);
}

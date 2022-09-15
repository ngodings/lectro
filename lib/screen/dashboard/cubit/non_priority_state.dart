part of 'non_priority_cubit.dart';

@immutable
abstract class NonPriorityState {}

class NonPriorityInitial extends NonPriorityState {}

class NonPriorityLoading extends NonPriorityState {}

class NonPrioritySuccess extends NonPriorityState {
  final DataSensor nonPrio;
  NonPrioritySuccess(this.nonPrio);
}

class CheckRefreshTokenSuccess extends NonPriorityState {
  final DataUser user;
  CheckRefreshTokenSuccess(this.user);
}

class CheckRefreshTokenFailed extends NonPriorityState {
  final String msg;
  CheckRefreshTokenFailed(this.msg);
}

class SettingNonPrioritySuccess extends NonPriorityState {
  final SensorSetting nonPrio;
  SettingNonPrioritySuccess(this.nonPrio);
}

class NonPrioSuccessMsg extends NonPriorityState {
  final String msg;
  NonPrioSuccessMsg(this.msg);
}

class NonPriorityFailed extends NonPriorityState {
  final String errors;
  NonPriorityFailed(this.errors);
}

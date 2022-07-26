part of 'battery_cubit.dart';

@immutable
abstract class BatteryState {}

class BatteryInitial extends BatteryState {}

class BatteryLoading extends BatteryState {}

class BatterySuccess extends BatteryState {
  final Battery battery;
  BatterySuccess(this.battery);
}

class BatteryFailed extends BatteryState {
  final String errors;
  BatteryFailed(this.errors);
}

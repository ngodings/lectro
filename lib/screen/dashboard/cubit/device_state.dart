part of 'device_cubit.dart';

@immutable
abstract class DeviceState {}

class DeviceInitial extends DeviceState {}

class DeviceLoading extends DeviceState {}

class DeviceStatusSuccess extends DeviceState {
  final DeviceStatus device;
  DeviceStatusSuccess(this.device);
}

class DeviceFailed extends DeviceState {
  final String errors;
  DeviceFailed(this.errors);
}

class DeviceSettingSuccess extends DeviceState {
  final List success;
  DeviceSettingSuccess(this.success);
}

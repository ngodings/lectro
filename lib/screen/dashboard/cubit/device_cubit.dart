import 'package:bloc/bloc.dart';
import 'package:lectro/models/device/is_online.dart';
import 'package:lectro/repositories/device_repository.dart';
import 'package:meta/meta.dart';

import '../../../helper/user_device.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceInitial());

  final _repo = DeviceRepository();

  Future<void> getDeviceStatus(DeviceStatusSuccess? device) async {
    if (device == null) {
      emit(DeviceLoading());
      final res = await _repo.getIsOnlineData();

      if (res.statusCode == 200) {
        emit(DeviceStatusSuccess(res.data));
      } else if (res.statusCode == 401) {
        print('melihat apakah masuk');
        await refreshToken();
        getDeviceStatus(device);
      } else {
        emit(DeviceFailed(res.message ?? ''));
      }
    }
  }

  Future<List> getListDevice(DeviceSettingSuccess? device) async {
    if (device == null) {
      emit(DeviceLoading());
      final res = await _repo.getListDeviceData();
      emit(DeviceSettingSuccess(res));
    }
    return [];
  }
}

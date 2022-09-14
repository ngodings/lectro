import 'package:bloc/bloc.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:lectro/models/sensor/sensor_setting.dart';
import 'package:lectro/repositories/non_priority_repository.dart';
import 'package:lectro/utils/alert_toast.dart';
import 'package:meta/meta.dart';

import '../../../helper/user_device.dart';

part 'non_priority_state.dart';

class NonPriorityCubit extends Cubit<NonPriorityState> {
  NonPriorityCubit() : super(NonPriorityInitial());

  final _repo = NonPriorityRepository();

  Future<void> getLastRecordNonPriority(DataSensor? nonPrio) async {
    if (nonPrio == null) {
      emit(NonPriorityLoading());

      final res = await _repo.getEnergyNonPriority();

      if (res.statusCode == 200) {
        emit(NonPrioritySuccess(res.data));
      } else if (res.statusCode == 401) {
        await refreshToken();
        getLastRecordNonPriority(nonPrio);
      } else {
        print('ini mesg');
        print(res.message);
        emit(NonPriorityFailed(res.message ?? ''));
      }
    } else {
      emit(NonPrioritySuccess(nonPrio));
    }
  }

  Future<void> getViewSettingNonPriority(SensorSetting? nonPrio) async {
    emit(NonPriorityLoading());
    final res = await _repo.getSettingNonPriorityR();
    if (res.statusCode == 200) {
      emit(NonPrioritySuccess(res.data));
    } else {
      emit(NonPriorityFailed(res.message ?? ''));
    }
  }

  Future<bool> getValueSettingNonPriority() async {
    emit(NonPriorityLoading());
    final res = await _repo.getValueSettingNonPriorityR();

    if (res.statusCode == 200) {
      if (res.data['control_relay'] == 1) {
        return true;
      } else {
        return false;
      }
    } else {
      showToastError('Try Again.');
      return false;
    }
  }

  Future<void> updateSettingNonPriority(String relay) async {
    emit(NonPriorityLoading());
    final res = await _repo.updateSettingNonPriorityR(relay);
    if (res.statusCode == 200) {
      emit(NonPrioSuccessMsg(res.data));
      showToastSuccess('Success!');
    } else {
      emit(NonPriorityFailed(res.message ?? ''));
      showToastError('Try again.');
    }
  }
}

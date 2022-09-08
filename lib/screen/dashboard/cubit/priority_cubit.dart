import 'package:bloc/bloc.dart';
import 'package:lectro/helper/user_device.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:lectro/models/sensor/sensor_setting.dart';
import 'package:lectro/repositories/priority_repository.dart';
import 'package:lectro/utils/constant.dart';
import 'package:meta/meta.dart';

import '../../../utils/alert_toast.dart';

part 'priority_state.dart';

class PriorityCubit extends Cubit<PriorityState> {
  PriorityCubit() : super(PriorityInitial());

  final _repo = PriorityRepository();

  Future<void> getLastRecordPriorityData(DataSensor? priority) async {
    if (priority == null) {
      emit(PriorityLoading());

      final res = await _repo.getPriorityData();

      if (res.statusCode == 200) {
        emit(PrioritySuccess(res.data));
      } else {
        emit(PriorityFailed(res.message ?? ''));
      }
    } else {
      emit(PrioritySuccess(priority));
    }
  }

  Future<void> getViewSettingPriority(SensorSetting? prio) async {
    emit(PriorityLoading());
    final res = await _repo.getSettingPriorityR();
    if (res.statusCode == 200) {
      emit(SettingPrioritySuccess(res.data));
    } else {
      emit(PriorityFailed(res.message ?? ''));
    }
  }

  Future<bool> getValueSettingPriority() async {
    emit(PriorityLoading());
    final res = await _repo.getValueSettingPriorityR();

    if (res.statusCode == 200) {
      if (res.data['control_relay'] == 1) {
        // showToastError('masuk relay.');
        return true;
      } else {
        return false;
      }
    } else {
      showToastError('Try again.');
      return false;
    }
  }

  Future<void> updateSettingPriority(String relay) async {
    emit(PriorityLoading());
    final res = await _repo.updateSettingPriorityR(relay);
    if (res.statusCode == 200) {
      emit(SettingPrioritySuccess(res.data));
      showToastSuccess('Success!');
    } else {
      emit(PriorityFailed(res.message ?? ''));
      showToastError('Try again.');
    }
  }

  Future<String> getEnergyLastRecordPriority() async {
    emit(PriorityLoading());
    final response = await _repo.getEnergyPriority();
    var priority = await secureStorage.read(key: lastEnergyPriority) ?? '0.00';
    // setState(() => value = priority);

    if (response != '') {
      emit(PrioritySuccessMessage(response));
    } else {
      emit(PriorityFailed(
        'Failed',
      ));
    }
    return priority;
  }
}

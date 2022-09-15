import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:lectro/models/sensor/sensor_setting.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/repositories/auth_repository.dart';
import 'package:lectro/repositories/non_priority_repository.dart';
import 'package:lectro/utils/alert_toast.dart';
import 'package:meta/meta.dart';

import '../../../helper/user_device.dart';
import '../../../services/navigation.dart';
import '../../../utils/api.dart';

part 'non_priority_state.dart';

class NonPriorityCubit extends Cubit<NonPriorityState> {
  NonPriorityCubit() : super(NonPriorityInitial());

  final _repo = NonPriorityRepository();

  Future<void> getLastRecordNonPriority(DataSensor? nonPrio) async {
    if (nonPrio == null) {
      emit(NonPriorityLoading());

      final res = await _repo.getEnergyNonPriority();
      final profil = await getProfiles();
      print('check profile');
      print(profil);
      if (res.statusCode == 200) {
        emit(NonPrioritySuccess(res.data));
      } else {
        final routes =
            profil!['data']['access_givens']['total_routes'].toString();
        final totalRoutes = int.parse(routes);

        if (totalRoutes == 0) {
          GetIt.I<NavigationServiceMain>().pushNamed('/scan-barcode');
          showToastError('Please add your device.');
        } else {
          final response = await getRefreshToken();
          if (response!['code'] == 200) {
            emit(CheckRefreshTokenSuccess(res.data));
          } else {
            emit(CheckRefreshTokenFailed(res.message ?? ''));
            GetIt.I<NavigationServiceMain>().pushReplacementNamed('/login');
            showToastError('Please login again');
          }
        }
        // final response = await _auth.getRefreshR();

        //  emit(NonPriorityFailed(res.message ?? ''));
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

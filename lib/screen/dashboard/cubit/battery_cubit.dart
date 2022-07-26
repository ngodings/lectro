import 'package:bloc/bloc.dart';
import 'package:lectro/models/sensor/battery.dart';
import 'package:lectro/repositories/battery_repository.dart';
import 'package:meta/meta.dart';

part 'battery_state.dart';

class BatteryCubit extends Cubit<BatteryState> {
  BatteryCubit() : super(BatteryInitial());

  final _repo = BatteryRepository();

  Future<void> getLastRecordBatteryData(Battery? battery) async {
    if (battery == null) {
      emit(BatteryLoading());
      final res = await _repo.getBatteryData();
      if (res.statusCode == 200) {
        emit(BatterySuccess(res.data));
      } else {
        emit(BatteryFailed(res.message ?? ''));
      }
    } else {
      emit(BatterySuccess(battery));
    }
  }
}

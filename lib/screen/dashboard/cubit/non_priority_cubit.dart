import 'package:bloc/bloc.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:lectro/repositories/non_priority_repository.dart';
import 'package:meta/meta.dart';

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
      } else {
        emit(NonPriorityFailed(res.message ?? ''));
      }
    } else {
      emit(NonPrioritySuccess(nonPrio));
    }
  }
}

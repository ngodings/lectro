import 'package:bloc/bloc.dart';
import 'package:lectro/models/sensor/data_sensor.dart';
import 'package:meta/meta.dart';

import '../../../repositories/grid_repository.dart';
part 'grid_state.dart';

class GridCubit extends Cubit<GridState> {
  GridCubit() : super(GridInitial());

  final _repo = GridRepository();

  Future<void> getLastRecordGridData(DataSensor? grid) async {
    if (grid == null) {
      emit(GridLoading());
      final res = await _repo.getGridData();

      if (res.statusCode == 200) {
        emit(GridSuccess(res.data));
      } else if (res.statusCode == 401) {
        //await refreshToken();
        getLastRecordGridData(grid);
      } else {
        emit(GridFailed(res.message ?? ''));
      }
    } else {
      emit(GridSuccess(grid));
    }
  }
}

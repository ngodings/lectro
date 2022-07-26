part of 'grid_cubit.dart';

@immutable
abstract class GridState {}

class GridInitial extends GridState {}

class GridLoading extends GridState {}

class GridSuccess extends GridState {
  final DataSensor grid;
  GridSuccess(this.grid);
}

class GridFailed extends GridState {
  final String errors;
  GridFailed(this.errors);
}

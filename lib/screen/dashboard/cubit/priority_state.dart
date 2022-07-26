part of 'priority_cubit.dart';

@immutable
abstract class PriorityState {}

class PriorityInitial extends PriorityState {}

class PriorityLoading extends PriorityState {}

class PrioritySuccess extends PriorityState {
  final DataSensor priority;
  PrioritySuccess(this.priority);
}

class PrioritySuccessMessage extends PriorityState {
  final String errors;
  PrioritySuccessMessage(this.errors);
}

class PriorityFailed extends PriorityState {
  final String errors;
  PriorityFailed(this.errors);
}

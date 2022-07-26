part of 'non_priority_cubit.dart';

@immutable
abstract class NonPriorityState {}

class NonPriorityInitial extends NonPriorityState {}

class NonPriorityLoading extends NonPriorityState {}

class NonPrioritySuccess extends NonPriorityState {
  final DataSensor nonPrio;
  NonPrioritySuccess(this.nonPrio);
}

class NonPrioSuccessMsg extends NonPriorityState {
  final String errors;
  NonPrioSuccessMsg(this.errors);
}

class NonPriorityFailed extends NonPriorityState {
  final String errors;
  NonPriorityFailed(this.errors);
}

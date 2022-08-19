import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_code_state.dart';

class RegisterCodeCubit extends Cubit<RegisterCodeState> {
  RegisterCodeCubit() : super(RegisterCodeInitial());

  void timersEnd() {
    emit(RegisterCodeTimersEnd());
  }

  void timersStart() {
    emit(RegisterCodeTimersStart());
  }
}

import 'package:bloc/bloc.dart';
import 'package:lectro/repositories/google_repository.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _google = GoogleRepository();

  Future<void> signUpWithGoogle() async {
    emit(RegisterLoading());
    final res = await _google.signUpGoogle();

    if (res.statusCode == 200) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterFailed(res.message));
    }
  }
}

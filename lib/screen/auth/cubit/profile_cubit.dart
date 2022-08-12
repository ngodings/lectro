import 'package:bloc/bloc.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import '../../../helper/user_device.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final _user = UserRepository();
  Future<void> getUserDeviceID() async {
    emit(ProfileLoading());
    final response = await getUserDevice();

    if (response != '') {
      emit(ProfileFailed('success'));
    } else {
      emit(ProfileFailed(
        'Failed',
      ));
    }
  }

  Future<void> getProfile(DataUser? user) async {
    if (user == null) {
      emit(ProfileLoading());
      final res = await _user.getUserData();

      if (res.statusCode == 200) {
        emit(ProfileSuccess(res.data));
      } else {
        emit(ProfileFailed(res.message ?? ''));
      }
    } else {
      emit(ProfileSuccess(user));
    }
  }
}

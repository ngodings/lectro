import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/models/user.dart';
import 'package:lectro/repositories/auth_repository.dart';
import 'package:lectro/repositories/user_repository.dart';
import 'package:lectro/utils/alert_toast.dart';
import 'package:meta/meta.dart';

import '../../../helper/user_device.dart';
import '../../../services/navigation.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final _user = UserRepository();
  final _auth = AuthRepository();
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

  Future<void> getDetailProfile() async {
    emit(ProfileLoading());
    final res = await _user.getAccessGivenR();

    if (res.statusCode == 200) {
      GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
      emit(AccessGivenProfilSuccess(res.data));
    } else {
      GetIt.I<NavigationServiceMain>().pushReplacementNamed('/scan-barcode');
      emit(ProfileFailed(res.message ?? ''));
    }
  }

  Future<void> updateCompleteProfile(
    String username,
    address,
    phone,
  ) async {
    emit(ProfileLoading());
    final res = await _user.completeProfile(
      username,
      address,
      phone,
    );
    if (res.statusCode == 200) {
      emit(CompleteProfileSuccess());
    } else {
      emit(ProfileFailed(res.message ?? ''));
    }
  }

  Future<void> updateEditProfile(
    String username,
    address,
    phone,
    fullName,
    about,
  ) async {
    emit(ProfileLoading());
    final res = await _user.editProfile(
      username,
      address,
      phone,
      fullName,
      about,
    );
    if (res.statusCode == 200) {
      emit(CompleteProfileSuccess());
      showToastSuccess('Success!');
    } else {
      emit(ProfileFailed(res.message ?? ''));
      showToastError('Try again.');
    }
  }

  void signOut() {
    _auth.signOut();
    showToastSuccess('Sign Out');
  }
}

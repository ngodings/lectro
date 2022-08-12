import '../models/user.dart';

class UserService {
  DataUser? _user;
  DataUser? get getUser => _user;

  set setUser(DataUser value) {
    _user = value;
  }
}

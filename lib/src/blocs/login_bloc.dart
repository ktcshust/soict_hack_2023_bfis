import 'dart:async';
import '../validators/validations.dart';

class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUser(username)) {
      _userController.sink.addError("Tài khoản không hợp lệ");
      return false;
    }
    _userController.sink.add("OK");

    if (!Validations.isValidPassword(password)) {
      _passController.sink.addError("Mật khẩu không hợp lệ phải trên 6 kí tự");
      return false;
    }
    _userController.sink.add("OK");
    _passController.sink.add("OK");
    return true;
  }

  void dispose() {
    _userController.close();
    _passController.close();
  }
}

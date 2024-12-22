import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  var error = "";
  var username = "";
  var password = "";
  var isLoggedIn = false;

  bool login() {
    if (username == "root" && password == "root") {
      error = "";
      isLoggedIn = true;
    } else {
      error = "Неправильный логин или пароль";
      isLoggedIn = false;
    }
    notifyListeners();
    return isLoggedIn;
  }
}

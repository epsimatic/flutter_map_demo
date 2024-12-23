import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  var error = "";
  var username = "";
  var password = "";
  var isLoggedIn = false;

  var savedPoints = <String, dynamic>{
    'точка 1': '36, 56',
    'точка 2': '37, 54',
    'точка 3': '36.5, 55.5',
    'точка 4': '36.2, 55.1', 
  };

  bool deleteItem(String key) {
    if (! savedPoints.containsKey(key)) return false;
    
    savedPoints.remove(key);
    notifyListeners();
    return true;
  }

  bool addItem(dynamic value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    savedPoints[_generateName()] = value;
    notifyListeners();
    return true;
  }

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
  
  static final _prefix = "точка ";
  String _generateName() {
    for (var i = 1; ; ++i) {
      if (! savedPoints.containsKey(_prefix + i.toString())) {
        return _prefix + i.toString();
      }
    }
  }
}

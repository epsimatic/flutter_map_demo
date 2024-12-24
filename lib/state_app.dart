import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';

class AppState extends ChangeNotifier {
  var error = "";
  var username = "";
  var password = "";
  var isLoggedIn = false;

  var savedPoints = <String, LatLng>{
    'точка 1': LatLng(56.836481, 60.595780),
    'точка 2': LatLng(56.839342, 60.611316),
    'точка 3': LatLng(56.839170, 60.614111),
    'точка 4': LatLng(56.833866, 60.606827),
  };

  bool deleteItem(String key) {
    if (! savedPoints.containsKey(key)) return false;
    
    savedPoints.remove(key);
    notifyListeners();
    return true;
  }

  bool addItem(LatLng value) {
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

import 'package:flutter/foundation.dart';

class DayProv extends ChangeNotifier {
  Map checked = {};
  Map workouts = {};

  void changeChecked(newVal, key) {
    checked[key] = newVal;
    notifyListeners();
  }
}

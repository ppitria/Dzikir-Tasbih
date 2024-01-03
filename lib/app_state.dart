import 'package:flutter/foundation.dart';

class AppState with ChangeNotifier {
  int count = 0;
  List<String> dzikirList = [];
  String selectedDzikir = '';
  int _counterLimit = 0;

  void reset() {
    count = 0;
    selectedDzikir = '';
    _counterLimit = 0;
    notifyListeners();
  }

  void counter() {
    if (_counterLimit == 0 || count < _counterLimit) {
      count++;
      notifyListeners();
    }
    notifyListeners();
  }

  void setCounter(int counterValue) {
    count = 0;
    _counterLimit = counterValue;
    notifyListeners();
  }

  void addToDzikirList(String dzikirText) {
    dzikirList.add(dzikirText);
    selectedDzikir = dzikirText;
    notifyListeners();
  }

  void saveChanges(String editedDzikir) {
    if (dzikirList.isNotEmpty) {
      dzikirList[dzikirList.length - 1] = editedDzikir;
      notifyListeners();
    }
  }

  void editDzikirList(String newDzikirText) {
    if (dzikirList.isNotEmpty) {
      dzikirList[dzikirList.length - 1] = newDzikirText;
      notifyListeners();
    }
  }
}

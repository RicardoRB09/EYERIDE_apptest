import 'package:flutter/widgets.dart';

class BottomNavbarService extends ChangeNotifier {
  int _selectedIndex = 0;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  int get selectedIndex {
    return _selectedIndex;
  }
}


import 'package:flutter/material.dart';
class myProvider extends ChangeNotifier {
  String? _user;

  String? get user => _user;

  void setUser(String user) {
    _user = user;
    notifyListeners();
  }

  String? getUser() {
     return _user;
  }
}

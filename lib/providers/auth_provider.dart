import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _userEmail;

  bool get isLoading => _isLoading;
  String? get userEmail => _userEmail;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simuler un délai d'API
    await Future.delayed(const Duration(seconds: 2));

    // Exemple simple de validation "mockée"
    if ((email == 'test@gmail.com' && password == '123456') ||
        (email == 'claudia@gmail.com' && password == 'motdepasse')) {
      _userEmail = email;
      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  void logout() {
    _userEmail = null;
    notifyListeners();
  }
}

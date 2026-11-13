
import 'package:flutter/foundation.dart';

import '../models/register_request.dart';
import '../services/register_service.dart';

class RegisterController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> register(RegisterRequest request) async {
    if (_isLoading) {
      throw StateError('Cadastro já está em andamento.');
    }

    _isLoading = true;
    notifyListeners();

    try {
      await RegisterService.register(request);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

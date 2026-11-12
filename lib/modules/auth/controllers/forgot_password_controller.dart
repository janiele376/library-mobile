
import 'package:flutter/foundation.dart';

import '../models/forgot_password_request.dart';
import '../services/forgot_password_service.dart';

class ForgotPasswordController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> forgotPassword(
    ForgotPasswordRequest request,
  ) async {
    if (_isLoading) {
      throw StateError(
        'Recuperação de senha já está em andamento.',
      );
    }

    _isLoading = true;
    notifyListeners();

    try {
      await ForgotPasswordService.forgotPassword(request);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

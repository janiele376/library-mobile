
import 'package:flutter/foundation.dart';

import '../../../core/services/auth/session_service.dart';
import '../../../core/services/routes/app_routes.dart';
import '../services/login_service.dart';

class LoginController extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<String> login({
    required String email,
    required String password,
  }) async {
    if (_isLoading) {
      throw StateError('Login já está em andamento.');
    }

    _isLoading = true;
    notifyListeners();

    try {
      await LoginService.login(
        email: email,
        password: password,
      );

      final authenticated =
          await SessionService.isAuthenticated();

      if (!authenticated) {
        throw Exception('Sessão inválida.');
      }

      final isAdmin = await SessionService.isAdmin();

      return isAdmin
          ? AppRoutes.adminDashboard
          : AppRoutes.userDashboard;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

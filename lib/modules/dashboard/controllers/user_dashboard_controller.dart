
import 'package:flutter/foundation.dart';

import '../models/user_dashboard_response.dart';
import '../services/user_dashboard_service.dart';

class UserDashboardController extends ChangeNotifier {
  UserDashboardResponse? _dashboard;
  bool _isLoading = false;
  String? _error;

  UserDashboardResponse? get dashboard => _dashboard;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDashboard() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dashboard = await UserDashboardService.getDashboard();
    } catch (_) {
      _error = 'dashboardLoadError';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

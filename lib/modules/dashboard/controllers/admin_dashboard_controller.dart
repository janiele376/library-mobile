
import 'package:flutter/foundation.dart';

import '../models/admin_dashboard_response.dart';
import '../services/admin_dashboard_service.dart';

class AdminDashboardController extends ChangeNotifier {
  AdminDashboardResponse? _dashboard;
  bool _isLoading = false;
  String? _error;

  AdminDashboardResponse? get dashboard => _dashboard;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadDashboard() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dashboard = await AdminDashboardService.getDashboard();
    } catch (_) {
      _error = 'dashboardLoadError';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

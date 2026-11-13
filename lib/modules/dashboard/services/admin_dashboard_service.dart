
import 'dart:convert';

import '../../../core/services/http/api_client.dart';
import '../models/admin_dashboard_response.dart';

class AdminDashboardService {
  AdminDashboardService._();

  static Future<AdminDashboardResponse> getDashboard() async {
    final response = await ApiClient.get(
      '/dashboard/admin',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return AdminDashboardResponse.fromJson(json);
    }

    throw Exception(
      'Erro ao carregar dashboard (${response.statusCode}).',
    );
  }
}

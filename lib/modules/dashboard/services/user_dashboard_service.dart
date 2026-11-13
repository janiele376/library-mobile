
import 'dart:convert';

import '../../../core/services/http/api_client.dart';
import '../models/user_dashboard_response.dart';

class UserDashboardService {
  UserDashboardService._();

  static Future<UserDashboardResponse> getDashboard() async {
    final response = await ApiClient.get(
      '/dashboard/me',
      authenticated: true,
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return UserDashboardResponse.fromJson(json);
    }

    throw Exception(
      'Erro ao carregar dashboard (${response.statusCode}).',
    );
  }
}

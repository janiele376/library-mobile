
import 'dart:convert';

import '../../../../../core/services/http/api_client.dart';
import '../models/user_profile.dart';

class UserProfileService {
  Future<UserProfile> getProfile() async {
    final response = await ApiClient.get(
      '/users/me',
      authenticated: true,
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível carregar seu perfil.');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    return UserProfile.fromJson(data);
  }

  Future<UserProfile> updateProfile({
    required String nameCompleted,
    required String email,
    required String phone,
    required String address,
    required String currentPassword,
    String? newPassword,
  }) async {
    final response = await ApiClient.put(
      '/users/me',
      authenticated: true,
      body: {
        'nameCompleted': nameCompleted,
        'email': email,
        'phone': phone.trim().isEmpty ? null : phone,
        'address': address,
        'currentPassword': currentPassword,
        if (newPassword != null && newPassword.isNotEmpty)
          'password': newPassword,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível atualizar seu perfil.');
    }

    return getProfile();
  }
}

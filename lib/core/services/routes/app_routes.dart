
import 'package:flutter/material.dart';

import '../../../modules/auth/presentation/pages/login_page.dart';
import '../../../modules/auth/presentation/pages/register_page.dart';
import '../../../modules/auth/presentation/pages/forgot_password_page.dart';

import '../../../modules/dashboard/presentation/pages/user_dashboard_page.dart';
import '../../../modules/dashboard/presentation/pages/admin_dashboard_page.dart';

import '../../../modules/settings/accessibility/presentation/pages/accessibility_page.dart';
import '../../../modules/settings/adjustments/presentation/pages/adjustments_page.dart';
import '../../../modules/settings/presentation/settings_page.dart';

import '../../../modules/admin/pages/users/presentation/pages/users_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  static const String userDashboard = '/dashboard/user';
  static const String adminDashboard = '/dashboard/admin';

  static const String acessibility = '/acessibility';
  static const String adjustments = '/adjustments';
  static const String settings = '/settings';

  static const String usersPage = '/users';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),

    userDashboard: (context) => const UserDashboardPage(),
    adminDashboard: (context) => const AdminDashboardPage(),

    acessibility: (context) => const AccessibilityPage(),
    adjustments: (context) => const AdjustmentsPage(),
    settings:(context) => const SettingsPage(),

    usersPage: (context) => const UsersPage(),
  };
}

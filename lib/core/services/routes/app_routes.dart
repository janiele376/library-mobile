
import 'package:flutter/material.dart';

// Autenticação.
import '../../../modules/auth/presentation/pages/login_page.dart';
import '../../../modules/auth/presentation/pages/register_page.dart';
import '../../../modules/auth/presentation/pages/forgot_password_page.dart';

// Dashboards.
import '../../../modules/dashboard/presentation/pages/user_dashboard_page.dart';
import '../../../modules/dashboard/presentation/pages/admin_dashboard_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  static const String userDashboard = '/dashboard/user';
  static const String adminDashboard = '/dashboard/admin';

  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),

    userDashboard: (context) => const UserDashboardPage(),
    adminDashboard: (context) => const AdminDashboardPage(),
  };
}

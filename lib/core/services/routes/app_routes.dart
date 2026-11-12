
import 'package:flutter/material.dart';

// Autenticação.
import '../../../modules/auth/pages/login_page.dart';
import '../../../modules/auth/pages/register_page.dart';
import '../../../modules/auth/pages/forgot_password_page.dart';

// Dashboards.
import '../../../modules/dashboard/pages/user_dashboard_page.dart';
import '../../../modules/dashboard/pages/admin_dashboard_page.dart';

class AppRoutes {
  AppRoutes._();

  // Rotas de autenticação.
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Rotas das dashboards.
  static const String userDashboard = '/dashboard/user';
  static const String adminDashboard = '/dashboard/admin';

  // Registro das rotas.
  static Map<String, WidgetBuilder> get routes => {
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),

    userDashboard: (context) => const UserDashboardPage(),
    adminDashboard: (context) => const AdminDashboardPage(),
  };
}

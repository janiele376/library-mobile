
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

import 'core/theme/app_theme.dart';
import 'core/services/routes/app_routes.dart';
import 'core/services/auth/session_service.dart';

import 'modules/auth/pages/login_page.dart';
import 'modules/dashboard/pages/user_dashboard_page.dart';
import 'modules/dashboard/pages/admin_dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biblioteca AltisLab+',
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('pt'),
      supportedLocales: AppLocalizations.supportedLocales,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,

      routes: AppRoutes.routes,

      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late Future<String?> _initialRouteFuture;

  @override
  void initState() {
    super.initState();
    _initialRouteFuture = _checkSession();
  }

  Future<String?> _checkSession() async {
    final isAuthenticated =
        await SessionService.isAuthenticated();

    if (!isAuthenticated) {
      return null;
    }

    final isAdmin = await SessionService.isAdmin();

    return isAdmin
        ? AppRoutes.adminDashboard
        : AppRoutes.userDashboard;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _initialRouteFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError || snapshot.data == null) {
          return const LoginPage();
        }

        if (snapshot.data == AppRoutes.adminDashboard) {
          return const AdminDashboardPage();
        }

        return const UserDashboardPage();
      },
    );
  }
}

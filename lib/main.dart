
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/localization/locale_controller.dart';
import 'core/accessibility/font_scale_controller.dart';
import 'core/services/routes/app_routes.dart';
import 'core/services/auth/session_service.dart';

import 'modules/auth/presentation/pages/login_page.dart';
import 'modules/dashboard/presentation/pages/user_dashboard_page.dart';
import 'modules/dashboard/presentation/pages/admin_dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController _themeController = ThemeController();
  final LocaleController _localeController = LocaleController();
  final FontScaleController _fontScaleController =
      FontScaleController();

  @override
  void dispose() {
    _themeController.dispose();
    _localeController.dispose();
    _fontScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _themeController,
        _localeController,
        _fontScaleController,
      ]),
      builder: (context, child) {
        return ThemeControllerScope(
          controller: _themeController,
          child: LocaleControllerScope(
            controller: _localeController,
            child: FontScaleControllerScope(
              controller: _fontScaleController,
              child: MaterialApp(
                title: 'Biblioteca AltisLab+',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: _localeController.locale,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: _themeController.themeMode,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(
                        _fontScaleController.fontScale,
                      ),
                    ),
                    child: child ?? const SizedBox.shrink(),
                  );
                },
                routes: AppRoutes.routes,
                home: const AuthGate(),
              ),
            ),
          ),
        );
      },
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
    final isAuthenticated = await SessionService.isAuthenticated();

    if (!isAuthenticated) return null;

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
            body: Center(child: CircularProgressIndicator()),
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


import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/routes/app_routes.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/form_header.dart';

import '../../controllers/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginController = LoginController();

  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _loginController.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _loginController.removeListener(_onControllerChanged);
    _loginController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  Future<void> _login() async {
    if (_loginController.isLoading) return;

    if (!_formKey.currentState!.validate()) return;

    try {
      final destination = await _loginController.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (!mounted) return;

      Navigator.of(context).pushNamedAndRemoveUntil(
        destination,
        (route) => false,
      );
    } on TimeoutException {
      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;
      _showMessage(l10n.connectionTimeout);
    } on SocketException {
      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;
      _showMessage(l10n.serverConnectionError);
    } catch (_) {
      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;
      _showMessage(l10n.loginError);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final textColor = colors.onSurface;
    final isLoading = _loginController.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormHeader(
            title: l10n.welcome,
            description: l10n.loginDescription,
            icon: Icons.menu_book_outlined,
            showBackButton: false,
          ),

          const SizedBox(height: 25),

          CustomTextField(
            icon: Icons.email_outlined,
            controller: _emailController,
            hint: l10n.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                AppValidators.email(value, l10n),
          ),

          const SizedBox(height: 5),

          CustomTextField(
            icon: Icons.lock_outline,
            controller: _passwordController,
            hint: l10n.password,
            obscureText: !_showPassword,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 30,
                minHeight: 0,
              ),
              visualDensity: VisualDensity.compact,
              icon: Icon(
                _showPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 17,
                color: textColor,
              ),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            validator: (value) =>
                AppValidators.required(value, l10n),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgotPassword,
                      );
                    },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.forgotPassword,
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                  decorationColor: textColor,
                  color: textColor,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: isLoading ? null : _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: colors.outline,
                    width: 2,
                  ),
                ),
              ),
              child: isLoading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.onPrimary,
                      ),
                    )
                  : Text(l10n.login),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: colors.outline,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Text(
                  l10n.or,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: colors.outline,
                  thickness: 1,
                ),
              ),
            ],
          ),

          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.register,
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.surface,
                foregroundColor: textColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: colors.outline,
                    width: 2,
                  ),
                ),
              ),
              child: Text(l10n.register),
            ),
          ),
        ],
      ),
    );
  }
}

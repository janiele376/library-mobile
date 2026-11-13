
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/utils/input_formatters.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/form_header.dart';

import '../../controllers/forgot_password_controller.dart';
import '../../models/forgot_password_request.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() =>
      _ForgotPasswordFormState();
}

class _ForgotPasswordFormState
    extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _forgotPasswordController = ForgotPasswordController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _forgotPasswordController.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _forgotPasswordController.removeListener(_onControllerChanged);
    _forgotPasswordController.dispose();

    _emailController.dispose();
    _cpfController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

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

  Future<void> _recoverPassword() async {
    if (_forgotPasswordController.isLoading) return;

    if (!_formKey.currentState!.validate()) return;

    final request = ForgotPasswordRequest(
      email: _emailController.text,
      cpf: _cpfController.text,
      newPassword: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    try {
      await _forgotPasswordController.forgotPassword(request);

      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;
      final successMessage = l10n.passwordRecoverySuccess;

      final navigator = Navigator.of(context);
      final messenger = ScaffoldMessenger.of(context);

      navigator.pop();

      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(successMessage),
            behavior: SnackBarBehavior.floating,
          ),
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
      _showMessage(l10n.passwordRecoveryError);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isLoading = _forgotPasswordController.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormHeader(
            title: l10n.forgotPasswordTitle,
            description: l10n.forgotPasswordDescription,
            icon: Icons.menu_book_outlined,
            showBackButton: true,
          ),

          const SizedBox(height: 22),

          CustomTextField(
            icon: Icons.mail_outline,
            controller: _emailController,
            hint: l10n.emailHint,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                AppValidators.email(value, l10n),
          ),

          CustomTextField(
            icon: Icons.badge_outlined,
            controller: _cpfController,
            hint: l10n.cpfHint,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.cpf,
            ],
            validator: (value) =>
                AppValidators.cpf(value, l10n),
          ),

          CustomTextField(
            icon: Icons.key_outlined,
            controller: _passwordController,
            hint: l10n.newPassword,
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
                color: colors.onSurface,
              ),
              onPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            validator: (value) =>
                AppValidators.password(value, l10n),
          ),

          CustomTextField(
            icon: Icons.key_outlined,
            controller: _confirmPasswordController,
            hint: l10n.confirmPassword,
            obscureText: !_showConfirmPassword,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 30,
                minHeight: 0,
              ),
              visualDensity: VisualDensity.compact,
              icon: Icon(
                _showConfirmPassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 17,
                color: colors.onSurface,
              ),
              onPressed: () {
                setState(() {
                  _showConfirmPassword = !_showConfirmPassword;
                });
              },
            ),
            validator: (value) =>
                AppValidators.confirmPassword(
                  value,
                  _passwordController.text,
                  l10n,
                ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 43,
            child: ElevatedButton(
              onPressed: isLoading ? null : _recoverPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
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
                  : Text(
                      l10n.recoverPassword,
                      style: const TextStyle(fontSize: 16),
                    ),
            ),
          ),

          const SizedBox(height: 2),

          Row(
            children: [
              Expanded(
                child: Divider(
                  color: colors.outline,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Text(
                  l10n.or,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onSurface,
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

          const SizedBox(height: 2),

          SizedBox(
            width: double.infinity,
            height: 43,
            child: OutlinedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      Navigator.maybePop(context);
                    },
              style: OutlinedButton.styleFrom(
                foregroundColor: colors.onSurface,
                side: BorderSide(
                  color: colors.outline,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                l10n.cancel,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
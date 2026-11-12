
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../../core/utils/app_validators.dart';
import '../../../core/utils/input_formatters.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/form_header.dart';

import '../controllers/register_controller.dart';
import '../models/register_request.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _emailController = TextEditingController();
  final _documentController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _registerController = RegisterController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void initState() {
    super.initState();
    _registerController.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _registerController.removeListener(_onControllerChanged);
    _registerController.dispose();

    _nameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _documentController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  Future<void> _selectBirthDate() async {
    if (_registerController.isLoading) return;

    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: now,
      initialDatePickerMode: DatePickerMode.year,
    );

    if (date == null || !mounted) return;

    _birthDateController.text =
        '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';

    _formKey.currentState?.validate();
  }

  String _formatBirthDateForApi() {
    final parts = _birthDateController.text.split('/');

    return '${parts[2]}-${parts[1]}-${parts[0]}';
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

  Future<void> _register() async {
    if (_registerController.isLoading) return;

    if (!_formKey.currentState!.validate()) return;

    final request = RegisterRequest(
      name: _nameController.text,
      birthDate: _formatBirthDateForApi(),
      email: _emailController.text,
      cpf: _documentController.text,
      phone: _phoneController.text,
      address: _addressController.text,
      password: _passwordController.text,
    );

    try {
      await _registerController.register(request);

      if (!mounted) return;

      final l10n = AppLocalizations.of(context)!;
      final successMessage = l10n.registerSuccess;

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
      _showMessage(l10n.registerError);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final isLoading = _registerController.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormHeader(
            title: l10n.registerTitle,
            description: l10n.registerDescription,
          ),

          const SizedBox(height: 14),

          CustomTextField(
            icon: Icons.account_circle_outlined,
            controller: _nameController,
            hint: l10n.fullName,
            validator: (value) =>
                AppValidators.name(value, l10n),
          ),

          CustomTextField(
            icon: Icons.calendar_today_outlined,
            controller: _birthDateController,
            hint: l10n.birthDateHint,
            readOnly: true,
            onTap: _selectBirthDate,
            validator: (value) =>
                AppValidators.birthDate(value, l10n),
          ),

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
            controller: _documentController,
            hint: l10n.cpfHint,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.cpf,
            ],
            validator: (value) =>
                AppValidators.cpf(value, l10n),
          ),

          CustomTextField(
            icon: Icons.phone_outlined,
            controller: _phoneController,
            hint: l10n.phoneHint,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              AppInputFormatters.phone,
            ],
            validator: (value) =>
                AppValidators.phone(value, l10n),
          ),

          CustomTextField(
            icon: Icons.location_on_outlined,
            controller: _addressController,
            hint: l10n.addressHint,
            validator: (value) =>
                AppValidators.address(value, l10n),
          ),

          CustomTextField(
            icon: Icons.key_outlined,
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

          const SizedBox(height: 8),

          SizedBox(
            width: double.infinity,
            height: 43,
            child: ElevatedButton(
              onPressed: isLoading ? null : _register,
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
                      l10n.createAccount,
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

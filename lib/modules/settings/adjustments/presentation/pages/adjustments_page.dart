
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_validators.dart';
import '../../../../../core/utils/app_formatter.dart';
import '../../../../../core/utils/input_formatters.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../models/user_profile.dart';
import '../../services/user_profile_service.dart';
import '../widgets/profile_action_buttons.dart';
import '../widgets/profile_help_dialog.dart';
import '../widgets/profile_identification.dart';
import '../widgets/profile_information_section.dart';

class AdjustmentsPage extends StatefulWidget {
  const AdjustmentsPage({super.key});

  @override
  State<AdjustmentsPage> createState() => _AdjustmentsPageState();
}

class _AdjustmentsPageState extends State<AdjustmentsPage> {
  final UserProfileService _profileService = UserProfileService();
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cpfController = TextEditingController();
  final _dateBirthController = TextEditingController();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  UserProfile? _profile;

  bool _isLoading = true;
  bool _isEditing = false;
  bool _isSaving = false;

  String? _errorMessage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cpfController.dispose();
    _dateBirthController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _loadProfile() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      final profile = await _profileService.getProfile();

      if (!mounted) return;

      setState(() {
        _profile = profile;
        _fillControllers(profile);
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        _errorMessage = l10n.profileLoadError;
      });
    }
  }

  void _fillControllers(UserProfile profile) {
    _nameController.text = profile.nameCompleted;
    _emailController.text = profile.email;

    _phoneController.text = AppInputFormatters.phone
        .formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: profile.phone ?? ''),
        )
        .text;

    _addressController.text = profile.address ?? '';

    _cpfController.text = AppInputFormatters.cpf
        .formatEditUpdate(
          TextEditingValue.empty,
          TextEditingValue(text: profile.cpf ?? ''),
        )
        .text;

    _dateBirthController.text = _formatDate(profile.dateBirth);
  }

  String _formatDate(String? value) {
    if (value == null || value.isEmpty) return '';

    final date = DateTime.tryParse(value);

    if (date == null) return value;

    return AppFormatters.formatDate(date);
  }

  void _clearPasswordFields() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
  }

  void _cancelEditing() {
    if (_profile == null) return;

    setState(() {
      _fillControllers(_profile!);
      _clearPasswordFields();
      _isEditing = false;
    });
  }

  Future<void> _saveProfile() async {
    final l10n = AppLocalizations.of(context)!;

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final updatedProfile = await _profileService.updateProfile(
        nameCompleted: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        currentPassword: _currentPasswordController.text,
        newPassword: _newPasswordController.text.isEmpty
            ? null
            : _newPasswordController.text,
      );

      if (!mounted) return;

      setState(() {
        _profile = updatedProfile;
        _fillControllers(updatedProfile);
        _clearPasswordFields();
        _isEditing = false;
        _isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.profileUpdated),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.profileUpdateError),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_errorMessage!),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                _loadProfile();
              },
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    if (_profile == null) {
      return Center(
        child: Text(l10n.profileNotFound),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              ProfileIdentification(
                name: _profile!.nameCompleted,
                email: _profile!.email,
              ),
              const SizedBox(height: 28),
              Form(
                key: _formKey,
                child: ProfileInformationSection(
                  children: [
                    CustomTextField(
                      icon: Icons.person_outline,
                      controller: _nameController,
                      hint: l10n.fullName,
                      readOnly: !_isEditing || _isSaving,
                      textCapitalization: TextCapitalization.words,
                      validator: _isEditing
                          ? (value) => AppValidators.name(value, l10n)
                          : null,
                    ),
                    CustomTextField(
                      icon: Icons.email_outlined,
                      controller: _emailController,
                      hint: l10n.email,
                      keyboardType: TextInputType.emailAddress,
                      readOnly: !_isEditing || _isSaving,
                      validator: _isEditing
                          ? (value) => AppValidators.email(value, l10n)
                          : null,
                    ),
                    CustomTextField(
                      icon: Icons.phone_outlined,
                      controller: _phoneController,
                      hint: l10n.phone,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [AppInputFormatters.phone],
                      readOnly: !_isEditing || _isSaving,
                      validator: _isEditing
                          ? (value) => AppValidators.phone(value, l10n)
                          : null,
                    ),
                    CustomTextField(
                      icon: Icons.location_on_outlined,
                      controller: _addressController,
                      hint: l10n.address,
                      readOnly: !_isEditing || _isSaving,
                      textCapitalization: TextCapitalization.words,
                      validator: _isEditing
                          ? (value) => AppValidators.address(value, l10n)
                          : null,
                    ),
                    CustomTextField(
                      icon: Icons.badge_outlined,
                      controller: _cpfController,
                      hint: l10n.cpf,
                      readOnly: true,
                    ),
                    CustomTextField(
                      icon: Icons.calendar_today_outlined,
                      controller: _dateBirthController,
                      hint: l10n.birthDate,
                      readOnly: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _isSaving
                            ? null
                            : () => ProfileHelpDialog.show(context),
                        child: Text(l10n.needHelp),
                      ),
                    ),
                    if (_isEditing) ...[
                      const Divider(height: 24),
                      CustomTextField(
                        icon: Icons.lock_outline,
                        controller: _currentPasswordController,
                        hint: '${l10n.currentPassword} *',
                        obscureText: true,
                        readOnly: _isSaving,
                        validator: (value) =>
                            AppValidators.password(value, l10n),
                      ),
                      CustomTextField(
                        icon: Icons.lock_reset_outlined,
                        controller: _newPasswordController,
                        hint: l10n.newPasswordOptional,
                        obscureText: true,
                        readOnly: _isSaving,
                        validator: (value) {
                          if (value == null || value.isEmpty) return null;
                          return AppValidators.password(value, l10n);
                        },
                      ),
                      CustomTextField(
                        icon: Icons.lock_outline,
                        controller: _confirmPasswordController,
                        hint: l10n.confirmNewPassword,
                        obscureText: true,
                        readOnly: _isSaving,
                        validator: (value) {
                          if (_newPasswordController.text.isEmpty &&
                              (value == null || value.isEmpty)) {
                            return null;
                          }

                          return AppValidators.confirmPassword(
                            value,
                            _newPasswordController.text,
                            l10n,
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ProfileActionButtons(
                isEditing: _isEditing,
                isSaving: _isSaving,
                onEdit: _startEditing,
                onConfirm: _saveProfile,
                onCancel: _cancelEditing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

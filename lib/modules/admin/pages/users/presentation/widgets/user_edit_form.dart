
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/utils/input_formatters.dart';
import '../../models/user_model.dart';
import '../../controllers/user_edit_form_controller.dart';

class UserEditForm extends StatefulWidget {
  final UserModel user;
  final ValueChanged<UserModel> onSave;

  const UserEditForm({
    super.key,
    required this.user,
    required this.onSave,
  });

  @override
  State<UserEditForm> createState() => _UserEditFormState();
}

class _UserEditFormState extends State<UserEditForm> {
  final _formKey = GlobalKey<FormState>();

  late final UserEditFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = UserEditFormController(widget.user);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSave(
      _controller.toUserModel(widget.user),
    );
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label é obrigatório';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            icon: Icons.person_outline,
            controller: _controller.nameController,
            hint: l10n.fullName,
            textCapitalization: TextCapitalization.words,
            validator: (value) =>
                _requiredValidator(value, l10n.fullName),
          ),
          CustomTextField(
            icon: Icons.email_outlined,
            controller: _controller.emailController,
            hint: l10n.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                _requiredValidator(value, l10n.email),
          ),
          CustomTextField(
            icon: Icons.phone_outlined,
            controller: _controller.phoneController,
            hint: l10n.phone,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              AppInputFormatters.phone,
            ],
          ),
          CustomTextField(
            icon: Icons.badge_outlined,
            controller: _controller.cpfController,
            hint: l10n.cpf,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.cpf,
            ],
          ),
          CustomTextField(
            icon: Icons.calendar_today_outlined,
            controller: _controller.dateBirthController,
            hint: l10n.birthDate,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.date,
            ],
          ),
          CustomTextField(
            icon: Icons.location_on_outlined,
            controller: _controller.addressController,
            hint: l10n.address,
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _save,
              icon: const Icon(
                Icons.save_outlined,
                size: 19,
              ),
              label: Text(l10n.save),
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

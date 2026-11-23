
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/utils/input_formatters.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../controllers/publisher_create_form_controller.dart';

class PublisherCreateForm extends StatefulWidget {
  final Future<void> Function({
    required String name,
    required String cnpj,
    required String email,
    required String phone,
    required String address,
  }) onSave;

  const PublisherCreateForm({
    super.key,
    required this.onSave,
  });

  @override
  State<PublisherCreateForm> createState() => _PublisherCreateFormState();
}

class _PublisherCreateFormState extends State<PublisherCreateForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = PublisherCreateFormController();

  bool _isSaving = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _requiredValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(context)!.requiredField;
    }

    return null;
  }

  String? _emailValidator(String? value) {
    final requiredError = _requiredValidator(value);

    if (requiredError != null) return requiredError;

    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if (!emailRegex.hasMatch(value!.trim())) {
      return 'Informe um e-mail válido';
    }

    return null;
  }

  String? _cnpjValidator(String? value) {
    final requiredError = _requiredValidator(value);

    if (requiredError != null) return requiredError;

    final digits = value!.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 14) {
      return 'Informe um CNPJ válido';
    }

    return null;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await widget.onSave(
        name: _controller.name,
        cnpj: _controller.cnpj,
        email: _controller.email,
        phone: _controller.phone,
        address: _controller.address,
      );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            icon: Icons.business_outlined,
            controller: _controller.nameController,
            hint: l10n.publisherName,
            validator: _requiredValidator,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            icon: Icons.badge_outlined,
            controller: _controller.cnpjController,
            hint: l10n.cnpj,
            keyboardType: TextInputType.number,
            inputFormatters: [AppInputFormatters.cnpj],
            validator: _cnpjValidator,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            icon: Icons.email_outlined,
            controller: _controller.emailController,
            hint: l10n.email,
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            icon: Icons.phone_outlined,
            controller: _controller.phoneController,
            hint: l10n.phone,
            keyboardType: TextInputType.phone,
            inputFormatters: [AppInputFormatters.phone],
            validator: _requiredValidator,
          ),
          const SizedBox(height: 14),
          CustomTextField(
            icon: Icons.location_on_outlined,
            controller: _controller.addressController,
            hint: l10n.address,
            validator: _requiredValidator,
            textCapitalization: TextCapitalization.sentences,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _isSaving ? null : _save,
              icon: _isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(
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

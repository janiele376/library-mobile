
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/utils/input_formatters.dart';
import '../../models/publisher_model.dart';
import '../../models/publisher_update_model.dart';
import '../../controllers/publisher_edit_form_controller.dart';

class PublisherEditForm extends StatefulWidget {
  final PublisherModel publisher;
  final ValueChanged<PublisherUpdateModel> onSave;

  const PublisherEditForm({
    super.key,
    required this.publisher,
    required this.onSave,
  });

  @override
  State<PublisherEditForm> createState() => _PublisherEditFormState();
}

class _PublisherEditFormState extends State<PublisherEditForm> {
  final _formKey = GlobalKey<FormState>();

  late final PublisherEditFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PublisherEditFormController(widget.publisher);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSave(
      _controller.toPublisherUpdateModel(widget.publisher),
    );
  }

  String? _requiredValidator(
    String? value,
    String label,
    AppLocalizations l10n,
  ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired(label);
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
            icon: Icons.business_outlined,
            controller: _controller.nameController,
            hint: l10n.publisherName,
            textCapitalization: TextCapitalization.words,
            validator: (value) =>
                _requiredValidator(value, l10n.publisherName, l10n),
          ),
          CustomTextField(
            icon: Icons.badge_outlined,
            controller: _controller.cnpjController,
            hint: l10n.cnpj,
          ),
          CustomTextField(
            icon: Icons.email_outlined,
            controller: _controller.emailController,
            hint: l10n.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                _requiredValidator(value, l10n.email, l10n),
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
              icon: const Icon(Icons.save_outlined, size: 19),
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

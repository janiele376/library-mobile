
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_validators.dart';
import '../../../../../l10n/app_localizations.dart';

class ProfileHelpDialog {
  static Future<void> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return const _ProfileHelpDialogContent();
      },
    );

    if (result == true && context.mounted) {
      final l10n = AppLocalizations.of(context)!;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.requestSent),
        ),
      );
    }
  }
}

class _ProfileHelpDialogContent extends StatefulWidget {
  const _ProfileHelpDialogContent();

  @override
  State<_ProfileHelpDialogContent> createState() =>
      _ProfileHelpDialogContentState();
}

class _ProfileHelpDialogContentState
    extends State<_ProfileHelpDialogContent> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    super.dispose();
  }

  void _send() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.needHelp),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: l10n.email,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  return AppValidators.email(value, l10n);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: l10n.subject,
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.helpSubjectRequired;
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: _send,
          child: Text(l10n.send),
        ),
      ],
    );
  }
}

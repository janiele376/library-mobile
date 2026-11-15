
import 'package:flutter/material.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

import '../../../../../core/localization/locale_controller.dart';
import 'accessibility_section_card.dart';
import 'accessibility_section_title.dart';

class LanguageOptionCard extends StatelessWidget {
  const LanguageOptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final localeController = LocaleControllerScope.of(context);

    return AccessibilitySectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccessibilitySectionTitle(
            icon: Icons.language,
            title: l10n.accessibilityLanguageTitle,
            description: l10n.accessibilityLanguageDescription,
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<Locale>(
            key: ValueKey(localeController.locale),
            initialValue: localeController.locale,
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: colors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: colors.outlineVariant,
                ),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: const Locale('pt'),
                child: Text(l10n.languagePortuguese),
              ),
              DropdownMenuItem(
                value: const Locale('en'),
                child: Text(l10n.languageEnglish),
              ),
              DropdownMenuItem(
                value: const Locale('es'),
                child: Text(l10n.languageSpanish),
              ),
            ],
            onChanged: (value) {
              if (value == null) return;

              localeController.setLocale(value);
            },
          ),
        ],
      ),
    );
  }
}

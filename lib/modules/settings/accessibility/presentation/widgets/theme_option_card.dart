
import 'package:flutter/material.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

import '../../../../../core/theme/theme_controller.dart';
import 'accessibility_section_card.dart';
import 'accessibility_section_title.dart';

class ThemeOptionCard extends StatelessWidget {
  const ThemeOptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final themeController = ThemeControllerScope.of(context);

    return AccessibilitySectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccessibilitySectionTitle(
            icon: Icons.palette_outlined,
            title: l10n.accessibilityThemeTitle,
            description: l10n.accessibilityThemeDescription,
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<ThemeMode>(
            key: ValueKey(themeController.themeMode),
            initialValue: themeController.themeMode,
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
                value: ThemeMode.light,
                child: Text(l10n.themeLight),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text(l10n.themeDark),
              ),
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text(l10n.themeSystem),
              ),
            ],
            onChanged: (value) {
              if (value == null) return;

              themeController.setTheme(value);
            },
          ),
        ],
      ),
    );
  }
}

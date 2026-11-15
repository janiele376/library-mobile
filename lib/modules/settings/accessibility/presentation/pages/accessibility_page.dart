
import 'package:flutter/material.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

import '../widgets/theme_option_card.dart';
import '../widgets/font_size_option_card.dart';
import '../widgets/language_option_card.dart';

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.accessibilityTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'serif',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.accessibilityDescription,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),
              const ThemeOptionCard(),
              const SizedBox(height: 16),
              const FontSizeOptionCard(),
              const SizedBox(height: 16),
              const LanguageOptionCard(),
            ],
          ),
        ),
      ),
    );
  }
}

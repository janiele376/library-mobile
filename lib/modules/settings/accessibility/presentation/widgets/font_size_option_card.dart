
import 'package:flutter/material.dart';
import 'package:library_mobile/l10n/app_localizations.dart';

import '../../../../../core/accessibility/font_scale_controller.dart';
import 'accessibility_section_card.dart';
import 'accessibility_section_title.dart';

class FontSizeOptionCard extends StatelessWidget {
  const FontSizeOptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final fontScaleController =
        FontScaleControllerScope.of(context);

    return AccessibilitySectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccessibilitySectionTitle(
            icon: Icons.format_size,
            title: l10n.accessibilityFontSizeTitle,
            description: l10n.accessibilityFontSizeDescription,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.accessibilityFontSmall,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              Text(
                l10n.accessibilityFontLarge,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          Slider(
            value: fontScaleController.fontScale,
            min: 0.8,
            max: 1.4,
            divisions: 6,
            label:
                '${(fontScaleController.fontScale * 100).round()}%',
            onChanged: fontScaleController.setFontScale,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              l10n.accessibilityFontPreview,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

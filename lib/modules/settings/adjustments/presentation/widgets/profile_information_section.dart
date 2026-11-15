
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class ProfileInformationSection extends StatelessWidget {
  final List<Widget> children;

  const ProfileInformationSection({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colors.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.personalInformation,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }
}

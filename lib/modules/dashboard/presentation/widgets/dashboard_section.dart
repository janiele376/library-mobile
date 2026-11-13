
import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  final String title;
  final Widget child;

  const DashboardSection({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: colors.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: colors.onPrimary,
                fontFamily: 'serif',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

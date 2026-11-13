
import 'package:flutter/material.dart';

class DashboardStatCard extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final Color? color;

  const DashboardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 6,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: colors.primary,
            size: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontSize: 15,
                fontFamily: 'serif',
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$value',
            style: theme.textTheme.titleMedium?.copyWith(
              color: colors.onSurface,
              fontWeight: FontWeight.w500,
              fontFamily: 'serif',
            ),
          ),
        ],
      ),
    );
  }
}

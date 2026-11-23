
import 'package:flutter/material.dart';

import 'admin_action_buttons.dart';

class AdminEntityListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> details;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRenew;
  final VoidCallback? onReturn;

  const AdminEntityListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.details,
    this.onEdit,
    this.onDelete,
    this.onRenew,
    this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: colors.outlineVariant.withValues(alpha: 0.45),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.onSurface.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: colors.tertiary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: colors.onTertiary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              height: 1,
              color: colors.outlineVariant.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            ...details,
            const SizedBox(height: 8),
            Divider(
              height: 1,
              color: colors.outlineVariant.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdminActionButtons(
                  onEdit: onEdit,
                  onDelete: onDelete,
                  onRenew: onRenew,
                  onReturn: onReturn,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

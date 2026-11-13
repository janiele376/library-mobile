
import 'package:flutter/material.dart';

import '../../models/dashboard_book.dart';

class DashboardBookCard extends StatelessWidget {
  final DashboardBook book;
  final String quantityLabel;

  const DashboardBookCard({
    super.key,
    required this.book,
    required this.quantityLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            Icons.book_outlined,
            color: colors.primary,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              book.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurface,
                fontSize: 15,
                fontFamily: 'serif',
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$quantityLabel: ${book.quantity}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.onSurface,
              fontFamily: 'serif',
            ),
          ),
        ],
      ),
    );
  }
}

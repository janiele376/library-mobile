
import 'package:flutter/material.dart';

import '../../models/most_rented_book.dart';

class MostRentedBookCard extends StatelessWidget {
  final MostRentedBook book;
  final String publisherLabel;
  final String releaseDateLabel;
  final String quantityLabel;

  const MostRentedBookCard({
    super.key,
    required this.book,
    required this.publisherLabel,
    required this.releaseDateLabel,
    required this.quantityLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final showCover = constraints.maxWidth >= 300;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: colors.onSurface,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'serif',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$publisherLabel: ${book.publisher}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface,
                      fontFamily: 'serif',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$releaseDateLabel: ${book.releaseDate}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface,
                      fontFamily: 'serif',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$quantityLabel: ${book.quantity}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colors.onSurface,
                      fontFamily: 'serif',
                    ),
                  ),
                ],
              ),
            ),
            if (showCover) ...[
              const SizedBox(width: 16),
              Container(
                width: 90,
                height: 125,
                decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colors.outline.withValues(alpha: 0.3),
                  ),
                ),
                child: Icon(
                  Icons.menu_book_rounded,
                  color: colors.onSurface,
                  size: 42,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}


import 'package:flutter/material.dart';

import '../../models/dashboard_rental.dart';

class DashboardRentalCard extends StatelessWidget {
  final DashboardRental rental;
  final int? index;
  final String Function(DateTime) formatDate;
  final String Function(String) statusLabel;
  final bool showDetails;

  const DashboardRentalCard({
    super.key,
    required this.rental,
    required this.formatDate,
    required this.statusLabel,
    this.index,
    this.showDetails = false,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index != null) ...[
                Text(
                  '$index.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontFamily: 'serif',
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: Text(
                  rental.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colors.onSurface,
                    fontSize: 15,
                    fontFamily: 'serif',
                  ),
                ),
              ),
            ],
          ),
          if (showDetails) ...[
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(
                left: index != null ? 22 : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatDate(rental.startDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatDate(rental.endDate),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    statusLabel(rental.status),
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

import 'dashboard_stat_card.dart';

class DashboardStatsGrid extends StatelessWidget {
  final List<DashboardStatCard> cards;

  const DashboardStatsGrid({
    super.key,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final columns = width >= 900
            ? 3
            : width >= 600
                ? 2
                : 1;

        const spacing = 12.0;

        final cardWidth = (width - spacing * (columns - 1)) / columns;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: cards
              .map(
                (card) => SizedBox(
                  width: cardWidth,
                  child: card,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

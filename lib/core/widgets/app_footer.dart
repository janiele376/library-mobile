
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      color: colors.surface,
      child: DefaultTextStyle(
        style: TextStyle(
          color: colors.onSurface,
          fontSize: 9,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.aboutUs,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(l10n.aboutDescription),
                ],
              ),
            ),

            const SizedBox(width: 6),

            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.contactUs,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: colors.onSurface,
                        size: 11,
                      ),
                      const SizedBox(width: 3),
                      const Expanded(
                        child: Text(
                          'biblioteca@gmail.com',
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: colors.onSurface,
                        size: 11,
                      ),
                      const SizedBox(width: 3),
                      const Expanded(
                        child: Text('99 9999-99999'),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: colors.onSurface,
                        size: 11,
                      ),
                      const SizedBox(width: 3),
                      const Expanded(
                        child: Text('biblioteca23'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 6),

            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.ourLocations,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(l10n.locationOne),
                  Text(l10n.locationTwo),
                  Text(l10n.locationThree),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

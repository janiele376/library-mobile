
import 'package:flutter/material.dart';

class ProfileIdentification extends StatelessWidget {
  final String name;
  final String email;

  const ProfileIdentification({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      children: [
        CircleAvatar(
          radius: 42,
          backgroundColor: colors.primaryContainer,
          child: Icon(
            Icons.person_outline,
            size: 46,
            color: colors.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          email,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

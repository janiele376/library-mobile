
import 'package:flutter/material.dart';

class AdminListRow extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool showDivider;

  const AdminListRow({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 12,
    ),
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        border: showDivider
            ? Border(
                bottom: BorderSide(
                  color: colors.outlineVariant,
                  width: 0.7,
                ),
              )
            : null,
      ),
      child: child,
    );
  }
}

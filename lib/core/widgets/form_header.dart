
import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool showBackButton;
  final VoidCallback? onBack;

  const FormHeader({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.menu_book_outlined,
    this.showBackButton = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textColor = colors.onSurface;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (showBackButton)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: onBack ??
                      () => Navigator.maybePop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: textColor,
                  ),
                ),
              ),

            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: textColor,
                  width: 2,
                ),
              ),
              child: Icon(
                icon,
                size: 32,
                color: textColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),

        const SizedBox(height: 3),

        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: textColor,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

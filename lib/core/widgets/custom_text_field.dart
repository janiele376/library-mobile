
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final inputColor =
        isDark ? AppTheme.darkInput : AppTheme.lightInput;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ícone externo.
          SizedBox(
            width: 24,
            height: 30,
            child: Icon(
              icon,
              size: 19,
              color: colors.onSurface,
            ),
          ),

          const SizedBox(width: 8),

          // Campo de texto.
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              readOnly: readOnly,
              onTap: onTap,
              inputFormatters: inputFormatters,
              style: TextStyle(
                fontSize: 12,
                color: colors.onSurface,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: colors.onSurface.withValues(
                    alpha: 0.55,
                  ),
                ),

                filled: true,
                fillColor: inputColor,

                isDense: true,

                // Mantém a mesma altura nos campos.
                constraints: const BoxConstraints(
                  minHeight: 34,
                ),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                // Ícone interno com tamanho controlado.
                suffixIcon: suffixIcon == null
                    ? null
                    : SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: suffixIcon!,
                        ),
                      ),

                suffixIconConstraints: const BoxConstraints(
                  minWidth: 30,
                  minHeight: 30,
                  maxHeight: 30,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: colors.primary,
                    width: 1,
                  ),
                ),

                errorStyle: const TextStyle(
                  fontSize: 10,
                ),
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/services.dart';

class AppInputFormatters {
  AppInputFormatters._();

  static TextInputFormatter get cpf => _MaskFormatter(
        type: _MaskType.cpf,
      );

  static TextInputFormatter get phone => _MaskFormatter(
        type: _MaskType.phone,
      );
}

enum _MaskType {
  cpf,
  phone,
}

class _MaskFormatter extends TextInputFormatter {
  final _MaskType type;

  _MaskFormatter({required this.type});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(
      RegExp(r'\D'),
      '',
    );

    final limited = digits.length > 11
        ? digits.substring(0, 11)
        : digits;

    final cursor = newValue.selection.end.clamp(
      0,
      newValue.text.length,
    );

    final digitsBeforeCursor = newValue.text
        .substring(0, cursor)
        .replaceAll(RegExp(r'\D'), '')
        .length
        .clamp(0, limited.length);

    final formatted = type == _MaskType.cpf
        ? _formatCpf(limited)
        : _formatPhone(limited);

    int newCursor = 0;
    int digitCount = 0;

    while (newCursor < formatted.length &&
        digitCount < digitsBeforeCursor) {
      if (RegExp(r'\d').hasMatch(formatted[newCursor])) {
        digitCount++;
      }
      newCursor++;
    }

    if (digitsBeforeCursor == limited.length &&
        cursor == newValue.text.length) {
      newCursor = formatted.length;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: newCursor,
      ),
    );
  }

  String _formatCpf(String digits) {
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      if (i == 3 || i == 6) buffer.write('.');
      if (i == 9) buffer.write('-');
      buffer.write(digits[i]);
    }

    return buffer.toString();
  }

  String _formatPhone(String digits) {
    if (digits.isEmpty) return '';

    if (digits.length <= 2) {
      return '($digits';
    }

    final ddd = digits.substring(0, 2);
    final number = digits.substring(2);

    final split = number.length > 8 ? 5 : 4;

    if (number.length <= split) {
      return '($ddd) $number';
    }

    return '($ddd) ${number.substring(0, split)}'
        '-${number.substring(split)}';
  }
}

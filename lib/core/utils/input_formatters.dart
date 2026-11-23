
import 'package:flutter/services.dart';

class AppInputFormatters {
  AppInputFormatters._();

  static TextInputFormatter get cpf => _MaskFormatter(
        type: _MaskType.cpf,
      );

  static TextInputFormatter get cnpj => _MaskFormatter(
        type: _MaskType.cnpj,
      );

  static TextInputFormatter get phone => _MaskFormatter(
        type: _MaskType.phone,
      );

  static TextInputFormatter get date => _MaskFormatter(
        type: _MaskType.date,
      );

  static LengthLimitingTextInputFormatter get isbn =>
      LengthLimitingTextInputFormatter(13);
}

enum _MaskType {
  cpf,
  cnpj,
  phone,
  date,
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

    final maxLength = switch (type) {
      _MaskType.date => 8,
      _MaskType.cnpj => 14,
      _ => 11,
    };

    final limited = digits.length > maxLength
        ? digits.substring(0, maxLength)
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

    final formatted = switch (type) {
      _MaskType.cpf => _formatCpf(limited),
      _MaskType.cnpj => _formatCnpj(limited),
      _MaskType.phone => _formatPhone(limited),
      _MaskType.date => _formatDate(limited),
    };

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

  String _formatCnpj(String digits) {
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      if (i == 2 || i == 5) buffer.write('.');
      if (i == 8) buffer.write('/');
      if (i == 12) buffer.write('-');

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

  String _formatDate(String digits) {
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      if (i == 2 || i == 4) buffer.write('/');

      buffer.write(digits[i]);
    }

    return buffer.toString();
  }
}

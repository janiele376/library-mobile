
import '../../l10n/app_localizations.dart';

class AppValidators {
  AppValidators._();

  static String? required(
    String? value,
    AppLocalizations l10n,
  ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.requiredField;
    }

    return null;
  }

  static String? name(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    if (value!.trim().length < 3) {
      return l10n.invalidName;
    }

    return null;
  }

  static String? email(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    final regex = RegExp(
      r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
    );

    if (!regex.hasMatch(value!.trim())) {
      return l10n.invalidEmail;
    }

    return null;
  }

  static String? cpf(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    final digits = value!.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 11 ||
        RegExp(r'^(\d)\1{10}$').hasMatch(digits)) {
      return l10n.invalidCpf;
    }

    final numbers = digits.split('').map(int.parse).toList();

    int calculateDigit(int count) {
      int sum = 0;

      for (int i = 0; i < count; i++) {
        sum += numbers[i] * (count + 1 - i);
      }

      final remainder = (sum * 10) % 11;

      return remainder == 10 ? 0 : remainder;
    }

    if (calculateDigit(9) != numbers[9] ||
        calculateDigit(10) != numbers[10]) {
      return l10n.invalidCpf;
    }

    return null;
  }

  static String? phone(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    final digits = value!.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 10 && digits.length != 11) {
      return l10n.invalidPhone;
    }

    const validDdds = {
      11, 12, 13, 14, 15, 16, 17, 18, 19,
      21, 22, 24, 27, 28,
      31, 32, 33, 34, 35, 37, 38,
      41, 42, 43, 44, 45, 46,
      47, 48, 49,
      51, 53, 54, 55,
      61, 62, 63, 64, 65, 66, 67,
      68, 69,
      71, 73, 74, 75, 77, 79,
      81, 82, 83, 84, 85, 86, 87, 88, 89,
      91, 92, 93, 94, 95, 96, 97, 98, 99,
    };

    final ddd = int.tryParse(digits.substring(0, 2));

    if (!validDdds.contains(ddd)) {
      return l10n.invalidPhone;
    }

    final number = digits.substring(2);

    if (digits.length == 11) {
      if (!number.startsWith('9')) {
        return l10n.invalidPhone;
      }
    } else {
      if (!RegExp(r'^[2-5]').hasMatch(number)) {
        return l10n.invalidPhone;
      }
    }

    return null;
  }

  static String? birthDate(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    final match = RegExp(
      r'^(\d{2})/(\d{2})/(\d{4})$',
    ).firstMatch(value!);

    if (match == null) {
      return l10n.invalidBirthDate;
    }

    final day = int.parse(match.group(1)!);
    final month = int.parse(match.group(2)!);
    final year = int.parse(match.group(3)!);

    if (year < 1900 || month < 1 || month > 12) {
      return l10n.invalidBirthDate;
    }

    final date = DateTime(year, month, day);

    if (date.year != year ||
        date.month != month ||
        date.day != day) {
      return l10n.invalidBirthDate;
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    if (date.isAfter(today)) {
      return l10n.invalidBirthDate;
    }

    return null;
  }

  static String? address(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    if (value!.trim().length < 5) {
      return l10n.invalidAddress;
    }

    return null;
  }

  static String? password(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    if (value!.length < 8) {
      return l10n.passwordMinLength;
    }

    return null;
  }

  static String? confirmPassword(
    String? value,
    String password,
    AppLocalizations l10n,
  ) {
    final error = required(value, l10n);
    if (error != null) return error;

    if (value != password) {
      return l10n.passwordsDoNotMatch;
    }

    return null;
  }
}


class AppFormatters {
  AppFormatters._();

  static String formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;

    return '$day/$month/$year';
  }

  static String formatCpf(String cpf) {
    final digits = cpf.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 11) return cpf;

    return '${digits.substring(0, 3)}.'
        '${digits.substring(3, 6)}.'
        '${digits.substring(6, 9)}-'
        '${digits.substring(9, 11)}';
  }


  static String formatCnpj(String cnpj) {
    final digits = cnpj.replaceAll(RegExp(r'\D'), '');

    if (digits.length != 14) return cnpj;

    return '${digits.substring(0, 2)}.'
        '${digits.substring(2, 5)}.'
        '${digits.substring(5, 8)}/'
        '${digits.substring(8, 12)}-'
        '${digits.substring(12, 14)}';
  }

  static String formatPhone(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 11) {
      return '(${digits.substring(0, 2)}) '
          '${digits.substring(2, 7)}-'
          '${digits.substring(7)}';
    }

    if (digits.length == 10) {
      return '(${digits.substring(0, 2)}) '
          '${digits.substring(2, 6)}-'
          '${digits.substring(6)}';
    }

    return phone;
  }
}

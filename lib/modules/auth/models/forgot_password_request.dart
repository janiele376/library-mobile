
class ForgotPasswordRequest {
  final String email;
  final String cpf;
  final String newPassword;
  final String confirmPassword;

  const ForgotPasswordRequest({
    required this.email,
    required this.cpf,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email.trim().toLowerCase(),
      'cpf': cpf.trim(),
      'newPassword': newPassword,
      'confirmPassword': confirmPassword,
    };
  }
}


class RegisterRequest {
  final String name;
  final String birthDate;
  final String email;
  final String cpf;
  final String phone;
  final String address;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.birthDate,
    required this.email,
    required this.cpf,
    required this.phone,
    required this.address,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'nameCompleted': name.trim(),
      'dateBirth': birthDate,
      'email': email.trim().toLowerCase(),
      'cpf': cpf.replaceAll(RegExp(r'\D'), ''),
      'phone': phone.replaceAll(RegExp(r'\D'), ''),
      'address': address.trim(),
      'password': password,
    };
  }
}

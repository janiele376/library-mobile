
class UserProfile {
  final int id;
  final String nameCompleted;
  final String email;
  final String? phone;
  final String? cpf;
  final String? dateBirth;
  final String? address;

  const UserProfile({
    required this.id,
    required this.nameCompleted,
    required this.email,
    this.phone,
    this.cpf,
    this.dateBirth,
    this.address,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as int,
      nameCompleted: json['nameCompleted'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      cpf: json['cpf'] as String?,
      dateBirth: json['dateBirth'] as String?,
      address: json['address'] as String?,
    );
  }
}

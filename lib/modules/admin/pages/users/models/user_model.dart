
class UserModel {
  final int id;
  final String nameCompleted;
  final String email;
  final String phone;
  final String cpf;
  final String dateBirth;
  final String address;

  const UserModel({
    required this.id,
    required this.nameCompleted,
    required this.email,
    required this.phone,
    required this.cpf,
    required this.dateBirth,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      nameCompleted: json['nameCompleted'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      cpf: json['cpf'] ?? '',
      dateBirth: json['dateBirth'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameCompleted': nameCompleted,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'dateBirth': dateBirth,
      'address': address,
    };
  }
}

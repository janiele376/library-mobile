
class PublisherModel {
  final int id;
  final String name;
  final String cnpj;
  final String email;
  final String phone;
  final String address;

  const PublisherModel({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory PublisherModel.fromJson(Map<String, dynamic> json) {
    return PublisherModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] ?? '',
      cnpj: json['cnpj'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cnpj': cnpj,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }
}


class PublisherUpdateModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;

  const PublisherUpdateModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory PublisherUpdateModel.fromJson(Map<String, dynamic> json) {
    return PublisherUpdateModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
    );
  }
}

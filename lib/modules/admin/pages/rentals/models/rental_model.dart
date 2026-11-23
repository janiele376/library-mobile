
class RentalModel {
  final int id;
  final int usersId;
  final int booksId;
  final String startDate;
  final String endDate;
  final String status;

  const RentalModel({
    required this.id,
    required this.usersId,
    required this.booksId,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory RentalModel.fromJson(Map<String, dynamic> json) {
    return RentalModel(
      id: (json['id'] as num).toInt(),
      usersId: (json['usersId'] as num).toInt(),
      booksId: (json['booksId'] as num).toInt(),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      status: json['status'] as String,
    );
  }
}

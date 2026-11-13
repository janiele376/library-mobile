
class DashboardRental {
  final int rentalId;
  final int bookId;
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String status;

  const DashboardRental({
    required this.rentalId,
    required this.bookId,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory DashboardRental.fromJson(Map<String, dynamic> json) {
    return DashboardRental(
      rentalId: json['rentalId'] as int,
      bookId: json['bookId'] as int,
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: json['status'] as String,
    );
  }
}

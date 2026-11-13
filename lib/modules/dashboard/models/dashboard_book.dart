
class DashboardBook {
  final int bookId;
  final String title;
  final int quantity;

  const DashboardBook({
    required this.bookId,
    required this.title,
    required this.quantity,
  });

  factory DashboardBook.fromJson(Map<String, dynamic> json) {
    return DashboardBook(
      bookId: json['bookId'] as int,
      title: json['title'] as String,
      quantity: json['quantity'] as int,
    );
  }
}

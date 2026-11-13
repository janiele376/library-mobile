
class MostRentedBook {
  final int bookId;
  final String title;
  final String publisher;
  final String releaseDate;
  final int quantity;

  const MostRentedBook({
    required this.bookId,
    required this.title,
    required this.publisher,
    required this.releaseDate,
    required this.quantity,
  });

  factory MostRentedBook.fromJson(Map<String, dynamic> json) {
    return MostRentedBook(
      bookId: json['bookId'] as int,
      title: json['title'] as String,
      publisher: json['publisher'] as String,
      releaseDate: json['releaseDate'] as String,
      quantity: json['quantity'] as int,
    );
  }
}

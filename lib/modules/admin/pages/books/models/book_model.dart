class BookModel {
  final int id;
  final String isbn;
  final String title;
  final String genre;
  final String releaseDate;
  final int? publisherId;
  final String? publisherName;
  final int quantity;

  const BookModel({
    required this.id,
    required this.isbn,
    required this.title,
    required this.genre,
    required this.releaseDate,
    this.publisherId,
    this.publisherName,
    required this.quantity,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: (json['id'] as num).toInt(),
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      genre: json['genre'] as String,
      releaseDate: json['releaseDate'] as String,
      publisherId: (json['publisherId'] as num?)?.toInt(),
      publisherName: json['publisherName'] as String?,
      quantity: (json['quantity'] as num).toInt(),
    );
  }
}
class BookUpdateModel {
  final int id;
  final String title;
  final String genre;
  final String releaseDate;
  final int publisherId;
  final int quantity;

  const BookUpdateModel({
    required this.id,
    required this.title,
    required this.genre,
    required this.releaseDate,
    required this.publisherId,
    required this.quantity,
  });

  factory BookUpdateModel.fromJson(Map<String, dynamic> json) {
    return BookUpdateModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      genre: json['genre'] as String,
      releaseDate: json['releaseDate'] as String,
      publisherId: (json['publisherId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );
  }
}
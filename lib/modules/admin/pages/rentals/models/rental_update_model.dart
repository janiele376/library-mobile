
class RentalUpdateModel {
  final int id;
  final int? usersId;
  final int? booksId;

  const RentalUpdateModel({
    required this.id,
    this.usersId,
    this.booksId,
  });

  Map<String, dynamic> toJson() {
    return {
      if (usersId != null) 'usersId': usersId,
      if (booksId != null) 'booksId': booksId,
    };
  }
}

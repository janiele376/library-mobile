
import 'package:flutter/material.dart';

import '../models/book_model.dart';
import '../models/book_update_model.dart';

class BookEditFormController {
  late final TextEditingController isbnController;
  late final TextEditingController titleController;
  late final TextEditingController genreController;
  late final TextEditingController releaseDateController;
  late final TextEditingController quantityController;

  int? selectedPublisherId;

  BookEditFormController(BookModel book) {
    isbnController = TextEditingController(
      text: book.isbn,
    );

    titleController = TextEditingController(
      text: book.title,
    );

    genreController = TextEditingController(
      text: book.genre,
    );

    releaseDateController = TextEditingController(
      text: _formatDateForDisplay(book.releaseDate),
    );

    quantityController = TextEditingController(
      text: book.quantity.toString(),
    );

    selectedPublisherId = book.publisherId;
  }

  String _formatDateForDisplay(String date) {
    final parsedDate = DateTime.tryParse(date);

    if (parsedDate == null) return date;

    final day = parsedDate.day.toString().padLeft(2, '0');
    final month = parsedDate.month.toString().padLeft(2, '0');
    final year = parsedDate.year.toString();

    return '$day/$month/$year';
  }

  String _formatDateForBackend(String date) {
    final parts = date.split('/');

    if (parts.length != 3) return date;

    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];

    return '$year-$month-$day';
  }

  BookUpdateModel toBookUpdateModel(BookModel book) {
    return BookUpdateModel(
      id: book.id,
      title: titleController.text.trim(),
      genre: genreController.text.trim(),
      releaseDate: _formatDateForBackend(
        releaseDateController.text.trim(),
      ),
      publisherId: selectedPublisherId!,
      quantity: int.tryParse(
            quantityController.text.trim(),
          ) ??
          0,
    );
  }

  void dispose() {
    isbnController.dispose();
    titleController.dispose();
    genreController.dispose();
    releaseDateController.dispose();
    quantityController.dispose();
  }
}


import 'package:flutter/material.dart';

class BookCreateFormController {
  late final TextEditingController isbnController;
  late final TextEditingController titleController;
  late final TextEditingController genreController;
  late final TextEditingController releaseDateController;
  late final TextEditingController quantityController;

  int? selectedPublisherId;

  BookCreateFormController() {
    isbnController = TextEditingController();
    titleController = TextEditingController();
    genreController = TextEditingController();
    releaseDateController = TextEditingController();
    quantityController = TextEditingController(text: '1');
  }

  void dispose() {
    isbnController.dispose();
    titleController.dispose();
    genreController.dispose();
    releaseDateController.dispose();
    quantityController.dispose();
  }
}

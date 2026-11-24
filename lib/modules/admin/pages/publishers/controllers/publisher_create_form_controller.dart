
import 'package:flutter/material.dart';

class PublisherCreateFormController {
  final nameController = TextEditingController();
  final cnpjController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String get name => nameController.text.trim();

  String get cnpj => cnpjController.text.replaceAll(RegExp(r'\D'), '');

  String get email => emailController.text.trim().toLowerCase();

  String get phone => phoneController.text.replaceAll(RegExp(r'\D'), '');

  String get address => addressController.text.trim();

  void dispose() {
    nameController.dispose();
    cnpjController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}

import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_formatter.dart';
import '../models/publisher_model.dart';
import '../models/publisher_update_model.dart';

class PublisherEditFormController {
  late final TextEditingController nameController;
  late final TextEditingController cnpjController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController addressController;

  PublisherEditFormController(PublisherModel publisher) {
    nameController = TextEditingController(
      text: publisher.name,
    );

    cnpjController = TextEditingController(
      text: AppFormatters.formatCnpj(publisher.cnpj),
    );

    emailController = TextEditingController(
      text: publisher.email.toLowerCase(),
    );

    phoneController = TextEditingController(
      text: AppFormatters.formatPhone(publisher.phone),
    );

    addressController = TextEditingController(
      text: publisher.address,
    );
  }


  PublisherUpdateModel toPublisherUpdateModel(PublisherModel publisher) {
    return PublisherUpdateModel(
      id: publisher.id,
      name: nameController.text.trim(),
      email: emailController.text.trim().toLowerCase(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
    );
  }

  void dispose() {
    nameController.dispose();
    cnpjController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}

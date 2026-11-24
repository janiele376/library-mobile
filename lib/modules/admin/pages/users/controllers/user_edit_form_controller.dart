
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../../../../../core/utils/app_formatter.dart';

class UserEditFormController {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController cpfController;
  late final TextEditingController dateBirthController;
  late final TextEditingController addressController;

  UserEditFormController(UserModel user) {
    nameController = TextEditingController(
      text: user.nameCompleted,
    );

    emailController = TextEditingController(
      text: user.email.toLowerCase(),
    );

    phoneController = TextEditingController(
      text: AppFormatters.formatPhone(user.phone),
    );

    cpfController = TextEditingController(
      text: AppFormatters.formatCpf(user.cpf),
    );

    dateBirthController = TextEditingController(
      text: user.dateBirth.isEmpty
          ? ''
          : AppFormatters.formatDate(
              DateTime.parse(user.dateBirth),
            ),
    );

    addressController = TextEditingController(
      text: user.address,
    );
  }

  UserModel toUserModel(UserModel user) {
    final dateParts = dateBirthController.text.trim().split('/');

    final formattedDate = dateParts.length == 3
        ? '${dateParts[2]}-${dateParts[1]}-${dateParts[0]}'
        : '';

    return UserModel(
      id: user.id,
      nameCompleted: nameController.text.trim(),
      email: emailController.text.trim().toLowerCase(),
      phone: phoneController.text.trim(),
      cpf: cpfController.text.replaceAll(RegExp(r'\D'), ''),
      dateBirth: formattedDate,
      address: addressController.text.trim(),
    );
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cpfController.dispose();
    dateBirthController.dispose();
    addressController.dispose();
  }
}

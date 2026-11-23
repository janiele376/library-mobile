
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/utils/app_formatter.dart';
import '../../../../widgets/admin_entity_information.dart';
import '../../../../widgets/admin_entity_list_item.dart';
import '../../models/user_model.dart';

class UserListItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const UserListItem({
    super.key,
    required this.user,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AdminEntityListItem(
      icon: Icons.person_outline,
      title: user.nameCompleted,
      subtitle: 'ID #${user.id}',
      details: [
        AdminEntityInformation(
          icon: Icons.badge_outlined,
          label: l10n.cpf,
          value: AppFormatters.formatCpf(user.cpf),
        ),
        AdminEntityInformation(
          icon: Icons.calendar_today_outlined,
          label: l10n.birthDate,
          value: AppFormatters.formatDate(
            DateTime.parse(user.dateBirth),
          ),
        ),
        AdminEntityInformation(
          icon: Icons.location_on_outlined,
          label: l10n.address,
          value: user.address,
        ),
      ],
      onEdit: onEdit,
      onDelete: onDelete,
    );
  }
}

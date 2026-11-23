
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/utils/app_formatter.dart';
import '../../../../widgets/admin_entity_information.dart';
import '../../../../widgets/admin_entity_list_item.dart';
import '../../models/publisher_model.dart';

class PublisherListItem extends StatelessWidget {
  final PublisherModel publisher;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const PublisherListItem({
    super.key,
    required this.publisher,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AdminEntityListItem(
      icon: Icons.business_outlined,
      title: publisher.name,
      subtitle: 'ID #${publisher.id}',
      details: [
        AdminEntityInformation(
          icon: Icons.badge_outlined,
          label: l10n.cnpj,
          value: AppFormatters.formatCnpj(publisher.cnpj),
        ),
        AdminEntityInformation(
          icon: Icons.email_outlined,
          label: l10n.email,
          value: publisher.email,
        ),
        AdminEntityInformation(
          icon: Icons.phone_outlined,
          label: l10n.phone,
          value: AppFormatters.formatPhone(publisher.phone),
        ),
        AdminEntityInformation(
          icon: Icons.location_on_outlined,
          label: l10n.address,
          value: publisher.address,
        ),
      ],
      onEdit: onEdit,
      onDelete: onDelete,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../widgets/admin_entity_information.dart';
import '../../../../widgets/admin_entity_list_item.dart';
import '../../models/book_model.dart';

class BookListItem extends StatelessWidget {
  final BookModel book;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const BookListItem({
    super.key,
    required this.book,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AdminEntityListItem(
      icon: Icons.menu_book_outlined,
      title: book.title,
      subtitle: 'ID #${book.id}',
      details: [
        AdminEntityInformation(
          icon: Icons.qr_code_outlined,
          label: l10n.bookIsbn,
          value: book.isbn,
        ),
        AdminEntityInformation(
          icon: Icons.category_outlined,
          label: l10n.bookGenre,
          value: book.genre,
        ),
        AdminEntityInformation(
          icon: Icons.calendar_today_outlined,
          label: l10n.bookReleaseDate,
          value: book.releaseDate,
        ),
        AdminEntityInformation(
          icon: Icons.business_outlined,
          label: l10n.bookPublisher,
          value: book.publisherName ?? '-',
        ),
        AdminEntityInformation(
          icon: Icons.inventory_2_outlined,
          label: l10n.bookQuantity,
          value: book.quantity.toString(),
        ),
      ],
      onEdit: onEdit,
      onDelete: onDelete,
    );
  }
}
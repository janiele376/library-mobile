
import 'package:flutter/material.dart';

import 'package:library_mobile/modules/admin/pages/users/services/user_service.dart';
import 'package:library_mobile/modules/admin/pages/books/services/book_service.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/utils/app_formatter.dart';
import '../../../../widgets/admin_entity_information.dart';
import '../../../../widgets/admin_entity_list_item.dart';
import '../../models/rental_model.dart';
import 'package:library_mobile/modules/admin/pages/users/models/user_model.dart';
import 'package:library_mobile/modules/admin/pages/books/models/book_model.dart';

class RentalListItem extends StatefulWidget {
  final RentalModel rental;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onRenew;
  final VoidCallback? onReturn;

  const RentalListItem({
    super.key,
    required this.rental,
    this.onEdit,
    this.onDelete,
    this.onRenew,
    this.onReturn,
  });

  @override
  State<RentalListItem> createState() => _RentalListItemState();
}

class _RentalListItemState extends State<RentalListItem> {
  final BookService _bookService = BookService();

  late Future<List<String>> _namesFuture;

  @override
  void initState() {
    super.initState();
    _namesFuture = _loadNames();
  }

  Future<List<String>> _loadNames() async {
    final results = await Future.wait<Object>([
      UserService.getUserById(widget.rental.usersId),
      _bookService.getBookById(widget.rental.booksId),
    ]);

    final user = results[0] as UserModel;
    final book = results[1] as BookModel;

    return [
      user.nameCompleted,
      book.title,
    ];
  }

  String _formatStatus(AppLocalizations l10n) {
    switch (widget.rental.status) {
      case 'ACTIVE':
        return l10n.rentalStatusActive;
      case 'DUE_SOON':
        return l10n.rentalStatusDueSoon;
      case 'LATE':
        return l10n.rentalStatusLate;
      case 'RETURNED':
        return l10n.rentalStatusReturned;
      default:
        return widget.rental.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final rental = widget.rental;

    final isReturned = rental.status == 'RETURNED';

    return FutureBuilder<List<String>>(
      future: _namesFuture,
      builder: (context, snapshot) {
        final userName = snapshot.hasData
            ? snapshot.data![0]
            : 'ID #${rental.usersId}';

        final bookTitle = snapshot.hasData
            ? snapshot.data![1]
            : 'ID #${rental.booksId}';

        return AdminEntityListItem(
          icon: Icons.assignment_outlined,
          title: '${l10n.rentalTitle} #${rental.id}',
          subtitle: 'ID #${rental.id}',
          details: [
            AdminEntityInformation(
              icon: Icons.person_outline,
              label: l10n.rentalUser,
              value: userName,
            ),
            AdminEntityInformation(
              icon: Icons.menu_book_outlined,
              label: l10n.rentalBook,
              value: bookTitle,
            ),
            AdminEntityInformation(
              icon: Icons.calendar_today_outlined,
              label: l10n.rentalStartDate,
              value: AppFormatters.formatDate(
                DateTime.parse(rental.startDate),
              ),
            ),
            AdminEntityInformation(
              icon: Icons.event_outlined,
              label: l10n.rentalEndDate,
              value: AppFormatters.formatDate(
                DateTime.parse(rental.endDate),
              ),
            ),
            AdminEntityInformation(
              icon: Icons.info_outline,
              label: l10n.rentalStatus,
              value: _formatStatus(l10n),
            ),
          ],
          onEdit: isReturned ? null : widget.onEdit,
          onDelete: isReturned ? widget.onDelete : null,
          onRenew: isReturned ? null : widget.onRenew,
          onReturn: isReturned ? null : widget.onReturn,
        );
      },
    );
  }
}

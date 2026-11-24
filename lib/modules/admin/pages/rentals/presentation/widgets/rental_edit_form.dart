
import 'package:flutter/material.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../controllers/rental_edit_form_controller.dart';
import '../../models/rental_model.dart';
import '../../models/rental_update_model.dart';

class RentalEditForm extends StatefulWidget {
  final RentalModel rental;
  final ValueChanged<RentalUpdateModel> onSave;

  const RentalEditForm({
    super.key,
    required this.rental,
    required this.onSave,
  });

  @override
  State<RentalEditForm> createState() => _RentalEditFormState();
}

class _RentalEditFormState extends State<RentalEditForm> {
  final _formKey = GlobalKey<FormState>();

  late final RentalEditFormController _controller;

  @override
  void initState() {
    super.initState();

    _controller = RentalEditFormController(
      rental: widget.rental,
    );

    _controller.loadInitialSelections();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final update = _controller.createUpdateModel();

    if (update == null) return;

    widget.onSave(update);
  }

  Widget _buildUserSearch(AppLocalizations l10n) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller.userController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_outline),
            hintText: l10n.rentalSearchUserHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: _controller.isSearchingUsers
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : _controller.selectedUserId != null
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      )
                    : null,
          ),
          onChanged: _controller.searchUsers,
          validator: (_) {
            if (_controller.selectedUserId == null) {
              return l10n.rentalUserRequired;
            }

            return null;
          },
        ),
        if (_controller.userError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _controller.userError!,
              style: TextStyle(color: colors.error),
            ),
          ),
        if (_controller.userResults.isNotEmpty)
          _buildResultsContainer(
            children: _controller.userResults.map((user) {
              return ListTile(
                leading: const Icon(Icons.person_outline),
                title: Text(
                  user.nameCompleted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () => _controller.selectUser(user),
              );
            }).toList(),
          ),
        if (_controller.searchedUsers &&
            _controller.userResults.isEmpty)
          _buildEmptyResults(l10n.rentalNoUsersFound),
      ],
    );
  }

  Widget _buildBookSearch(AppLocalizations l10n) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller.bookController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.menu_book_outlined),
            hintText: l10n.rentalSearchBookHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: _controller.isSearchingBooks
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : _controller.selectedBookId != null
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      )
                    : null,
          ),
          onChanged: _controller.searchBooks,
          validator: (_) {
            if (_controller.selectedBookId == null) {
              return l10n.rentalBookRequired;
            }

            return null;
          },
        ),
        if (_controller.bookError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _controller.bookError!,
              style: TextStyle(color: colors.error),
            ),
          ),
        if (_controller.bookResults.isNotEmpty)
          _buildResultsContainer(
            children: _controller.bookResults.map((book) {
              return ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(
                  book.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  l10n.rentalAvailableStock(book.quantity),
                ),
                onTap: () => _controller.selectBook(book),
              );
            }).toList(),
          ),
        if (_controller.searchedBooks &&
            _controller.bookResults.isEmpty)
          _buildEmptyResults(l10n.rentalNoBooksAvailable),
      ],
    );
  }

  Widget _buildResultsContainer({
    required List<Widget> children,
  }) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 6),
      constraints: const BoxConstraints(maxHeight: 220),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: children.length,
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: colors.outlineVariant,
        ),
        itemBuilder: (_, index) => children[index],
      ),
    );
  }

  Widget _buildEmptyResults(String message) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        message,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 13,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_controller.isLoadingInitial)
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(),
                )
              else ...[
                _buildUserSearch(l10n),
                const SizedBox(height: 16),
                _buildBookSearch(l10n),
              ],
              if (_controller.changeError != null) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _controller.changeError!,
                    style: TextStyle(
                      color: colors.error,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: _controller.isLoadingInitial ? null : _save,
                  icon: const Icon(
                    Icons.save_outlined,
                    size: 19,
                  ),
                  label: Text(l10n.save),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primary,
                    foregroundColor: colors.onPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

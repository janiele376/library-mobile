
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/utils/input_formatters.dart';
import '../../../publishers/models/publisher_model.dart';
import '../../../publishers/services/publisher_service.dart';
import '../../controllers/book_create_form_controller.dart';

class BookCreateForm extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> onSave;

  const BookCreateForm({
    super.key,
    required this.onSave,
  });

  @override
  State<BookCreateForm> createState() => _BookCreateFormState();
}

class _BookCreateFormState extends State<BookCreateForm> {
  final _formKey = GlobalKey<FormState>();

  late final BookCreateFormController _controller;

  final PublisherService _publisherService = PublisherService();
  final TextEditingController _publisherController =
      TextEditingController();

  Timer? _publisherDebounce;

  List<PublisherModel> _publisherResults = [];

  bool _isSearchingPublishers = false;
  bool _searchedPublishers = false;

  String? _publisherError;

  int? _publisherSearchVersion;

  @override
  void initState() {
    super.initState();
    _controller = BookCreateFormController();
  }

  @override
  void dispose() {
    _publisherDebounce?.cancel();
    _publisherController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _searchPublishers(String query) {
    _publisherDebounce?.cancel();

    final version = (_publisherSearchVersion ?? 0) + 1;
    _publisherSearchVersion = version;

    setState(() {
      _controller.selectedPublisherId = null;
      _publisherResults = [];
      _publisherError = null;
      _searchedPublishers = false;
    });

    if (query.trim().length < 2) {
      setState(() {
        _isSearchingPublishers = false;
      });
      return;
    }

    _publisherDebounce = Timer(
      const Duration(milliseconds: 350),
      () async {
        if (!mounted) return;

        setState(() {
          _isSearchingPublishers = true;
        });

        try {
          final page = await _publisherService.getPublishers(
            name: query,
            page: 0,
            size: 10,
          );

          if (!mounted || version != _publisherSearchVersion) {
            return;
          }

          setState(() {
            _publisherResults = page.content;
            _isSearchingPublishers = false;
            _searchedPublishers = true;
          });
        } catch (_) {
          if (!mounted || version != _publisherSearchVersion) {
            return;
          }

          final l10n = AppLocalizations.of(context)!;

          setState(() {
            _publisherError = l10n.bookSearchPublisherError;
            _isSearchingPublishers = false;
          });
        }
      },
    );
  }

  void _selectPublisher(PublisherModel publisher) {
    _publisherDebounce?.cancel();
    _publisherSearchVersion =
        (_publisherSearchVersion ?? 0) + 1;

    setState(() {
      _controller.selectedPublisherId = publisher.id;
      _publisherController.text = publisher.name;
      _publisherResults = [];
      _publisherError = null;
      _searchedPublishers = false;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSave({
      'isbn': _controller.isbnController.text.trim(),
      'title': _controller.titleController.text.trim(),
      'genre': _controller.genreController.text.trim(),
      'releaseDate': _formatDateForBackend(
        _controller.releaseDateController.text.trim(),
      ),
      'publisherId': _controller.selectedPublisherId,
      'quantity': int.parse(
        _controller.quantityController.text.trim(),
      ),
    });
  }

  String _formatDateForBackend(String date) {
    final parts = date.split('/');

    if (parts.length != 3) return date;

    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];

    return '$year-$month-$day';
  }

  String? _requiredValidator(
    String? value,
    String label,
    AppLocalizations l10n,
  ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired(label);
    }

    return null;
  }

  String? _isbnValidator(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = _requiredValidator(
      value,
      l10n.bookIsbn,
      l10n,
    );

    if (error != null) return error;

    if (value!.trim().length > 13) {
      return l10n.bookIsbnMaxLength;
    }

    return null;
  }

  String? _dateValidator(
    String? value,
    AppLocalizations l10n,
  ) {
    final error = _requiredValidator(
      value,
      l10n.bookReleaseDate,
      l10n,
    );

    if (error != null) return error;

    final date = value!.trim();

    if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(date)) {
      return l10n.bookDateFormat;
    }

    final parts = date.split('/');
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    if (day == null || month == null || year == null) {
      return l10n.bookDateInvalid;
    }

    final parsedDate = DateTime(year, month, day);

    if (parsedDate.day != day ||
        parsedDate.month != month ||
        parsedDate.year != year) {
      return l10n.bookDateInvalid;
    }

    return null;
  }

  String? _quantityValidator(
    String? value,
    AppLocalizations l10n,
  ) {
    if (value == null || value.trim().isEmpty) {
      return l10n.bookQuantityRequired;
    }

    final quantity = int.tryParse(value);

    if (quantity == null || quantity < 0) {
      return l10n.bookQuantityInvalid;
    }

    return null;
  }

  Widget _buildPublisherSearch(AppLocalizations l10n) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _publisherController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.business_outlined),
            hintText: l10n.bookPublisher,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: _isSearchingPublishers
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
                : _controller.selectedPublisherId != null
                    ? const Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      )
                    : null,
          ),
          onChanged: _searchPublishers,
          validator: (_) {
            if (_controller.selectedPublisherId == null) {
              return l10n.bookSelectPublisherError;
            }

            return null;
          },
        ),

        if (_publisherError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _publisherError!,
              style: TextStyle(color: colors.error),
            ),
          ),

        if (_publisherResults.isNotEmpty)
          Container(
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
              itemCount: _publisherResults.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: colors.outlineVariant,
              ),
              itemBuilder: (context, index) {
                final publisher = _publisherResults[index];

                return ListTile(
                  leading: const Icon(Icons.business_outlined),
                  title: Text(
                    publisher.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _selectPublisher(publisher),
                );
              },
            ),
          ),

        if (_searchedPublishers && _publisherResults.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              l10n.bookNoPublishersFound,
              style: TextStyle(
                color: colors.onSurfaceVariant,
                fontSize: 13,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            icon: Icons.qr_code_outlined,
            controller: _controller.isbnController,
            hint: l10n.bookIsbn,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              AppInputFormatters.isbn,
            ],
            validator: (value) => _isbnValidator(value, l10n),
          ),
          CustomTextField(
            icon: Icons.menu_book_outlined,
            controller: _controller.titleController,
            hint: l10n.bookTitle,
            textCapitalization: TextCapitalization.words,
            validator: (value) =>
                _requiredValidator(value, l10n.bookTitle, l10n),
          ),
          CustomTextField(
            icon: Icons.category_outlined,
            controller: _controller.genreController,
            hint: l10n.bookGenre,
            textCapitalization: TextCapitalization.words,
            validator: (value) =>
                _requiredValidator(value, l10n.bookGenre, l10n),
          ),
          CustomTextField(
            icon: Icons.calendar_today_outlined,
            controller: _controller.releaseDateController,
            hint: l10n.bookReleaseDate,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.date,
            ],
            validator: (value) => _dateValidator(value, l10n),
          ),
          CustomTextField(
            icon: Icons.inventory_2_outlined,
            controller: _controller.quantityController,
            hint: l10n.bookQuantity,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) =>
                _quantityValidator(value, l10n),
          ),

          const SizedBox(height: 12),

          _buildPublisherSearch(l10n),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _save,
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
  }
}

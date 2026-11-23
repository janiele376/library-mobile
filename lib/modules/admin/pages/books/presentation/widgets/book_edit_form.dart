
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../l10n/app_localizations.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../../../../core/utils/input_formatters.dart';
import '../../../publishers/models/publisher_model.dart';
import '../../../publishers/services/publisher_service.dart';
import '../../models/book_model.dart';
import '../../models/book_update_model.dart';
import '../../controllers/book_edit_form_controller.dart';

class BookEditForm extends StatefulWidget {
  final BookModel book;
  final ValueChanged<BookUpdateModel> onSave;

  const BookEditForm({
    super.key,
    required this.book,
    required this.onSave,
  });

  @override
  State<BookEditForm> createState() => _BookEditFormState();
}

class _BookEditFormState extends State<BookEditForm> {
  final _formKey = GlobalKey<FormState>();

  late final BookEditFormController _controller;

  final PublisherService _publisherService = PublisherService();
  final TextEditingController _publisherController =
      TextEditingController();

  Timer? _publisherDebounce;

  List<PublisherModel> _publisherResults = [];

  bool _isLoadingPublisher = true;
  bool _isSearchingPublishers = false;
  bool _searchedPublishers = false;

  String? _publisherError;

  int _publisherSearchVersion = 0;

  @override
  void initState() {
    super.initState();

    _controller = BookEditFormController(widget.book);

    _loadCurrentPublisher();
  }

  @override
  void dispose() {
    _publisherDebounce?.cancel();
    _publisherController.dispose();
    _controller.dispose();

    super.dispose();
  }

  Future<void> _loadCurrentPublisher() async {
    try {
      if (_controller.selectedPublisherId != null) {
        final publisher = await _publisherService.getPublisherById(
          _controller.selectedPublisherId!,
        );

        if (!mounted) return;

        _publisherController.text = publisher.name;
      }
    } catch (_) {
      if (!mounted) return;

      setState(() {
        _publisherError =
            'Não foi possível carregar a editora atual.';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingPublisher = false;
        });
      }
    }
  }

  void _searchPublishers(String query) {
    _publisherDebounce?.cancel();

    final version = ++_publisherSearchVersion;

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

          setState(() {
            _publisherError =
                'Não foi possível pesquisar editoras.';
            _isSearchingPublishers = false;
          });
        }
      },
    );
  }

  void _selectPublisher(PublisherModel publisher) {
    _publisherDebounce?.cancel();
    _publisherSearchVersion++;

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

    widget.onSave(
      _controller.toBookUpdateModel(widget.book),
    );
  }

  String? _requiredValidator(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label é obrigatório';
    }

    return null;
  }

  String? _quantityValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe a quantidade.';
    }

    final quantity = int.tryParse(value);

    if (quantity == null || quantity < 0) {
      return 'Informe uma quantidade válida.';
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
              return 'Selecione uma editora.';
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
              'Nenhuma editora encontrada.',
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
            readOnly: true,
          ),
          CustomTextField(
            icon: Icons.menu_book_outlined,
            controller: _controller.titleController,
            hint: l10n.bookTitle,
            textCapitalization: TextCapitalization.words,
            validator: (value) =>
                _requiredValidator(value, l10n.bookTitle),
          ),
          CustomTextField(
            icon: Icons.category_outlined,
            controller: _controller.genreController,
            hint: l10n.bookGenre,
            textCapitalization: TextCapitalization.words,
            validator: (value) =>
                _requiredValidator(value, l10n.bookGenre),
          ),
          CustomTextField(
            icon: Icons.calendar_today_outlined,
            controller: _controller.releaseDateController,
            hint: l10n.bookReleaseDate,
            keyboardType: TextInputType.number,
            inputFormatters: [
              AppInputFormatters.date,
            ],
            validator: (value) =>
                _requiredValidator(value, l10n.bookReleaseDate),
          ),
          CustomTextField(
            icon: Icons.inventory_2_outlined,
            controller: _controller.quantityController,
            hint: l10n.bookQuantity,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: _quantityValidator,
          ),

          const SizedBox(height: 12),

          if (_isLoadingPublisher)
            const CircularProgressIndicator()
          else
            _buildPublisherSearch(l10n),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _isLoadingPublisher ||
                      _publisherError != null
                  ? null
                  : _save,
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


import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/publisher_model.dart';
import '../models/publisher_update_model.dart';
import '../services/publisher_service.dart';

class PublishersPageController extends ChangeNotifier {
  final PublisherService _publisherService;

  PublishersPageController({
    PublisherService? publisherService,
  }) : _publisherService = publisherService ?? PublisherService();

  List<PublisherModel> publishers = [];

  bool isLoading = true;
  bool hasError = false;

  String search = '';

  int currentPage = 1;
  int totalPages = 1;

  static const int pageSize = 5;

  Timer? _searchDebounce;

  Future<void> loadPublishers() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final result = await _publisherService.getPublishers(
        name: search,
        page: currentPage - 1,
        size: pageSize,
      );

      publishers = result.content;

      totalPages = result.totalPages > 0
          ? result.totalPages
          : 1;

      currentPage = result.currentPage + 1;
    } catch (_) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void onSearchChanged(String value) {
    search = value.trim();
    currentPage = 1;

    _searchDebounce?.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: 400),
      loadPublishers,
    );
  }

  Future<void> changePage(int page) async {
    if (page < 1 || page > totalPages) return;

    currentPage = page;
    await loadPublishers();
  }

  Future<PublisherModel> createPublisher({
    required String name,
    required String cnpj,
    required String email,
    required String phone,
    required String address,
  }) async {
    final publisher = await _publisherService.createPublisher(
      name: name,
      cnpj: cnpj,
      email: email,
      phone: phone,
      address: address,
    );

    currentPage = 1;
    await loadPublishers();

    return publisher;
  }

  Future<PublisherUpdateModel> updatePublisher({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    final publisher = await _publisherService.updatePublisher(
      id: id,
      name: name,
      email: email,
      phone: phone,
      address: address,
    );

    await loadPublishers();

    return publisher;
  }

  Future<void> deletePublisher(int id) async {
    final shouldGoToPreviousPage =
        publishers.length == 1 && currentPage > 1;

    await _publisherService.deletePublisher(id);

    if (shouldGoToPreviousPage) {
      currentPage--;
    }

    await loadPublishers();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }
}

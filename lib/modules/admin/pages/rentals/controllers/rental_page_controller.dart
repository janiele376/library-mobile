
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../models/rental_model.dart';
import '../services/rental_service.dart';

class RentalPageController extends ChangeNotifier {
  final RentalService _rentalService;

  RentalPageController({
    RentalService? rentalService,
  }) : _rentalService = rentalService ?? RentalService();

  List<RentalModel> rentals = [];

  bool isLoading = true;
  bool hasError = false;

  String searchQuery = '';

  int currentPage = 1;
  int totalPages = 1;

  static const int pageSize = 5;

  Timer? _searchDebounce;

  Future<void> loadRentals() async {
    isLoading = true;
    hasError = false;

    notifyListeners();

    try {
      final result = await _rentalService.getRentals(
        userName: searchQuery,
        page: currentPage - 1,
        size: pageSize,
      );

      rentals = result.content;

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
    searchQuery = value.trim();
    currentPage = 1;

    _searchDebounce?.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: 400),
      loadRentals,
    );
  }

  Future<void> changePage(int page) async {
    if (page < 1 || page > totalPages) return;

    currentPage = page;

    await loadRentals();
  }

  Future<RentalModel> createRental({
    required int usersId,
    required int booksId,
  }) async {
    final rental = await _rentalService.createRental(
      usersId: usersId,
      booksId: booksId,
    );

    currentPage = 1;

    await loadRentals();

    return rental;
  }

  Future<RentalModel> updateRental({
    required int id,
    int? usersId,
    int? booksId,
  }) async {
    final rental = await _rentalService.updateRental(
      id: id,
      usersId: usersId,
      booksId: booksId,
    );

    await loadRentals();

    return rental;
  }

  Future<void> deleteRental(int id) async {
    final shouldGoToPreviousPage =
        rentals.length == 1 && currentPage > 1;

    await _rentalService.deleteRental(id);

    if (shouldGoToPreviousPage) {
      currentPage--;
    }

    await loadRentals();
  }

  Future<RentalModel> renewRental(int id) async {
    final rental = await _rentalService.renewRental(id);

    await loadRentals();

    return rental;
  }

  Future<RentalModel> returnRental(int id) async {
    final rental = await _rentalService.returnRental(id);

    await loadRentals();

    return rental;
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }
}

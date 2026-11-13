
import 'dashboard_book.dart';
import 'dashboard_rental.dart';
import 'most_rented_book.dart';

class AdminDashboardResponse {
  final int onTimeRentals;
  final int nearDueRentals;
  final int overdueRentals;
  final List<DashboardRental> lastRentals;
  final int totalRentals;
  final int totalBooks;
  final int totalPublishers;
  final MostRentedBook? mostRentedBook;
  final List<DashboardBook> availableBooks;
  final int totalAvailableBooks;
  final Map<int, int> activeRentalsByBook;

  const AdminDashboardResponse({
    required this.onTimeRentals,
    required this.nearDueRentals,
    required this.overdueRentals,
    required this.lastRentals,
    required this.totalRentals,
    required this.totalBooks,
    required this.totalPublishers,
    required this.mostRentedBook,
    required this.availableBooks,
    required this.totalAvailableBooks,
    required this.activeRentalsByBook,
  });

  factory AdminDashboardResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final booksPage =
        json['availableBooks'] as Map<String, dynamic>;

    final activeRentals =
        json['activeRentalsByBook'] as Map<String, dynamic>? ?? {};

    return AdminDashboardResponse(
      onTimeRentals: (json['onTimeRentals'] as num).toInt(),
      nearDueRentals: (json['nearDueRentals'] as num).toInt(),
      overdueRentals: (json['overdueRentals'] as num).toInt(),
      lastRentals: (json['lastRentals'] as List)
          .map(
            (item) => DashboardRental.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalRentals: (json['totalRentals'] as num).toInt(),
      totalBooks: (json['totalBooks'] as num).toInt(),
      totalPublishers: (json['totalPublishers'] as num).toInt(),
      mostRentedBook: json['mostRentedBook'] == null
          ? null
          : MostRentedBook.fromJson(
              json['mostRentedBook'] as Map<String, dynamic>,
            ),
      availableBooks: (booksPage['content'] as List)
          .map(
            (item) => DashboardBook.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      totalAvailableBooks:
          (booksPage['totalElements'] as num).toInt(),
      activeRentalsByBook: activeRentals.map(
        (key, value) => MapEntry(
          int.parse(key),
          (value as num).toInt(),
        ),
      ),
    );
  }
}

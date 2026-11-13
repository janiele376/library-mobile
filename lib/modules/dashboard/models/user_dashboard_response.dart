
import 'dashboard_book.dart';
import 'dashboard_rental.dart';
import 'most_rented_book.dart';

class UserDashboardResponse {
  final List<DashboardRental> lastRentals;
  final int onTimeRentals;
  final int nearDueRentals;
  final int overdueRentals;
  final String? mostRentedBook;
  final MostRentedBook? mostRentedBookDetails;
  final List<DashboardBook> availableBooks;
  final int totalAvailableBooks;

  const UserDashboardResponse({
    required this.lastRentals,
    required this.onTimeRentals,
    required this.nearDueRentals,
    required this.overdueRentals,
    required this.mostRentedBook,
    required this.mostRentedBookDetails,
    required this.availableBooks,
    required this.totalAvailableBooks,
  });

  factory UserDashboardResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    final booksPage =
        json['availableBooks'] as Map<String, dynamic>;

    return UserDashboardResponse(
      lastRentals: (json['lastRentals'] as List)
          .map(
            (item) => DashboardRental.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList(),
      onTimeRentals: json['onTimeRentals'] as int,
      nearDueRentals: json['nearDueRentals'] as int,
      overdueRentals: json['overdueRentals'] as int,
      mostRentedBook: json['mostRentedBook'] as String?,
      mostRentedBookDetails:
          json['mostRentedBookDetails'] == null
              ? null
              : MostRentedBook.fromJson(
                  json['mostRentedBookDetails']
                      as Map<String, dynamic>,
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
    );
  }
}

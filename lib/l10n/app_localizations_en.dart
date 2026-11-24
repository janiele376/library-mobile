// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Library';

  @override
  String get welcome => 'Welcome!';

  @override
  String get loginDescription => 'Log in to access your library';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get login => 'Log In';

  @override
  String get register => 'Sign Up';

  @override
  String get or => 'or';

  @override
  String get aboutUs => 'About Us';

  @override
  String get aboutDescription =>
      'Our mission is to inform you about our products with convenience.';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get ourLocations => 'Our Locations';

  @override
  String get locationOne => 'Rua Padre Filho, 263 - Centro.';

  @override
  String get locationTwo => 'Rua IV, 60 - Paulista.';

  @override
  String get locationThree => 'Rua Norte Europeu, 110 - Vale Central.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get registerTitle => 'Registration';

  @override
  String get registerDescription =>
      'Fill in the information below to create your account.';

  @override
  String get fullName => 'Full Name';

  @override
  String get birthDateHint => 'DD/MM/YYYY';

  @override
  String get emailHint => 'user@gmail.com';

  @override
  String get cpfHint => '000.000.000-00';

  @override
  String get phoneHint => '+99 99999-9999';

  @override
  String get addressHint => 'Street, Number - Neighborhood';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get registerAction => 'Register';

  @override
  String get alreadyHaveAccount => 'Already have an account? Log In';

  @override
  String get cancel => 'Cancel';

  @override
  String get requiredField => 'Required field';

  @override
  String get invalidEmail => 'Enter a valid email address';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters long';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get loginTitle => 'Login';

  @override
  String get forgotPasswordTitle => 'Reset Password';

  @override
  String get forgotPasswordDescription =>
      'Enter your credentials to regain access.';

  @override
  String get newPassword => 'Password';

  @override
  String get recoverPassword => 'Recover';

  @override
  String get connectionTimeout => 'Connection timed out.';

  @override
  String get serverConnectionError => 'Could not connect to the server.';

  @override
  String get invalidCredentials => 'Invalid email or password.';

  @override
  String get loginError => 'Unable to log in. Please try again.';

  @override
  String get registerSuccess => 'Account created successfully!';

  @override
  String get registerError =>
      'Unable to create account. Check your information or existing email/CPF.';

  @override
  String get passwordRecoverySuccess => 'Password changed successfully!';

  @override
  String get passwordRecoveryError =>
      'Unable to change password. Check your information.';

  @override
  String get invalidName => 'Enter a valid name';

  @override
  String get invalidCpf => 'Invalid CPF';

  @override
  String get invalidPhone => 'Invalid phone number. Include area code.';

  @override
  String get invalidBirthDate => 'Invalid date of birth';

  @override
  String get invalidAddress => 'Enter a valid address';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardGlobalStats => 'Global Statistics';

  @override
  String get dashboardTotalRentals => 'Total Rentals';

  @override
  String get dashboardTotalBooks => 'Registered Books';

  @override
  String get dashboardTotalPublishers => 'Registered Publishers';

  @override
  String get dashboardRentalStatus => 'Rental Status';

  @override
  String get dashboardOnTime => 'On Time';

  @override
  String get dashboardNearDue => 'Due Soon';

  @override
  String get dashboardOverdue => 'Overdue';

  @override
  String get dashboardLastRentals => 'Recently Rented Books';

  @override
  String get dashboardMostRentedBook => 'Most Rented Book';

  @override
  String get dashboardAvailableBooks => 'Available Books';

  @override
  String dashboardTotalAvailableBooks(int count) {
    return 'Total books: $count';
  }

  @override
  String get dashboardPublisher => 'Publisher';

  @override
  String get dashboardReleaseDate => 'Release Date';

  @override
  String get dashboardQuantity => 'Quantity';

  @override
  String get dashboardRentalQuantity => 'Number of Rentals';

  @override
  String get dashboardNoRentals => 'No rentals found.';

  @override
  String get dashboardNoBooks => 'No books found.';

  @override
  String get dashboardNoAvailableBooks => 'No books available.';

  @override
  String get dashboardNoData => 'No data available.';

  @override
  String get dashboardLoadError => 'Unable to load the dashboard.';

  @override
  String get dashboardRetry => 'Try Again';

  @override
  String get dashboardViewMore => 'VIEW MORE';

  @override
  String get dashboardStatusNearDue => 'Approaching Due Date';

  @override
  String get dashboardAccessibilityUnavailable =>
      'Accessibility page is under development.';

  @override
  String get dashboardProfileUnavailable =>
      'Profile page has not been configured yet.';

  @override
  String get dashboardAdminAreaUnavailable =>
      'Admin area has not been configured yet.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get accessibilityTitle => 'Personalize your experience';

  @override
  String get accessibilityDescription =>
      'Configure the appearance and readability of the app.';

  @override
  String get accessibilityThemeTitle => 'App theme';

  @override
  String get accessibilityThemeDescription =>
      'Choose the appearance of the app.';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeSystem => 'Follow system';

  @override
  String get accessibilityFontSizeTitle => 'Font size';

  @override
  String get accessibilityFontSizeDescription => 'Adjust the text size.';

  @override
  String get accessibilityFontSmall => 'Small';

  @override
  String get accessibilityFontLarge => 'Large';

  @override
  String get accessibilityFontPreview =>
      'Sample text to preview the selected size.';

  @override
  String get accessibilityLanguageTitle => 'Language';

  @override
  String get accessibilityLanguageDescription => 'Select the app language.';

  @override
  String get languagePortuguese => 'Portuguese';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Español';

  @override
  String get phone => 'Phone';

  @override
  String get address => 'Address';

  @override
  String get cpf => 'CPF';

  @override
  String get birthDate => 'Date of birth';

  @override
  String get needHelp => 'Need help?';

  @override
  String get currentPassword => 'Current password';

  @override
  String get newPasswordOptional => 'New password (optional)';

  @override
  String get confirmNewPassword => 'Confirm new password';

  @override
  String get profileLoadError => 'Unable to load your profile.';

  @override
  String get retry => 'Try again';

  @override
  String get profileNotFound => 'Profile not found.';

  @override
  String get profileUpdated => 'Profile updated successfully!';

  @override
  String get profileUpdateError =>
      'Unable to update. Check your current password and try again.';

  @override
  String get editInformation => 'Edit information';

  @override
  String get confirm => 'Confirm';

  @override
  String get requestSent => 'Request sent successfully!';

  @override
  String get helpEmailRequired => 'Enter your email.';

  @override
  String get helpSubjectRequired => 'Enter the subject.';

  @override
  String get subject => 'Subject';

  @override
  String get send => 'Send';

  @override
  String get personalInformation => 'Personal information';

  @override
  String get menuTitle => 'MENU';

  @override
  String get adminAreaTitle => 'Admin Area';

  @override
  String get logout => 'Log out';

  @override
  String get logoutConfirmation => 'Do you want to log out?';

  @override
  String get usersTab => 'Users';

  @override
  String get rentalsTab => 'Rentals';

  @override
  String get booksTab => 'Books';

  @override
  String get publishersTab => 'Publishers';

  @override
  String get adminSearchHint => 'Search...';

  @override
  String get filters => 'Filters';

  @override
  String get previousPage => 'Previous page';

  @override
  String get nextPage => 'Next page';

  @override
  String get view => 'View';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get renew => 'Renew';

  @override
  String get returnBook => 'Return';

  @override
  String get userName => 'User Name';

  @override
  String get actions => 'Actions';

  @override
  String get save => 'Save';

  @override
  String get cnpj => 'CNPJ';

  @override
  String get publisherName => 'Publisher name';

  @override
  String get bookTitle => 'Book title';

  @override
  String get bookIsbn => 'ISBN';

  @override
  String get bookGenre => 'Genre';

  @override
  String get bookPublisher => 'Publisher';

  @override
  String get bookReleaseDate => 'Release date';

  @override
  String get bookQuantity => 'Quantity';

  @override
  String get bookCreateTitle => 'Register book';

  @override
  String get bookEditTitle => 'Edit book';

  @override
  String get bookDeleteTitle => 'Delete book';

  @override
  String get bookDeleteConfirmation =>
      'Are you sure you want to delete this book?';

  @override
  String get bookSearchHint => 'Search by title, genre or ISBN';

  @override
  String get bookLoadError => 'Could not load books.';

  @override
  String get bookCreateSuccess => 'Book registered successfully!';

  @override
  String get bookUpdateSuccess => 'Book updated successfully!';

  @override
  String get bookDeleteSuccess => 'Book deleted successfully.';

  @override
  String get bookPublisherRequired => 'Select a publisher.';

  @override
  String get bookQuantityRequired => 'Enter the quantity.';

  @override
  String get bookQuantityInvalid => 'Quantity cannot be negative.';

  @override
  String get noResults => 'No books found.';

  @override
  String get rentalTitle => 'Rental';

  @override
  String get rentalUser => 'User';

  @override
  String get rentalBook => 'Book';

  @override
  String get rentalStartDate => 'Start date';

  @override
  String get rentalEndDate => 'Return date';

  @override
  String get rentalStatus => 'Status';

  @override
  String get rentalCreateTitle => 'Create rental';

  @override
  String get rentalEditTitle => 'Edit rental';

  @override
  String get rentalDeleteTitle => 'Delete rental';

  @override
  String get rentalDeleteConfirmation =>
      'Are you sure you want to delete this rental?';

  @override
  String get rentalSearchHint => 'Search by user or book...';

  @override
  String get rentalLoadError => 'Error loading rentals.';

  @override
  String get rentalCreateSuccess => 'Rental created successfully!';

  @override
  String get rentalUpdateSuccess => 'Rental updated successfully!';

  @override
  String get rentalDeleteSuccess => 'Rental deleted successfully!';

  @override
  String get rentalRenewSuccess => 'Rental renewed successfully!';

  @override
  String get rentalReturnSuccess => 'Book returned successfully!';

  @override
  String get rentalUserRequired => 'Select a user.';

  @override
  String get rentalBookRequired => 'Select a book.';

  @override
  String get rentalRenewConfirmation => 'Do you want to renew this rental?';

  @override
  String get rentalReturnConfirmation =>
      'Do you want to confirm the return of this book?';

  @override
  String get rentalNoResults => 'No rentals found.';

  @override
  String get rentalStatusActive => 'Active';

  @override
  String get rentalStatusDueSoon => 'Due soon';

  @override
  String get rentalStatusLate => 'Overdue';

  @override
  String get rentalStatusReturned => 'Returned';

  @override
  String get userDeleteTitle => 'Delete user';

  @override
  String get userDeleteConfirmation =>
      'Are you sure you want to delete this user?';

  @override
  String get userDeleteIrreversible => 'This action cannot be undone.';

  @override
  String get rentalEditSubtitle =>
      'Change the user or book associated with the rental';

  @override
  String get close => 'Close';

  @override
  String get rentalDeleteIrreversible => 'This action cannot be undone.';

  @override
  String get rentalCreateSubtitle => 'Select the user and the book';

  @override
  String get bookDeleteIrreversible => 'This action cannot be undone.';

  @override
  String get bookCreateSubtitle => 'Fill in the new book details';

  @override
  String get publisherCreateTitle => 'Register publisher';

  @override
  String get publisherCreateSubtitle => 'Fill in the new publisher details';

  @override
  String get publisherDeleteTitle => 'Delete publisher';

  @override
  String get publisherDeleteConfirmation =>
      'Are you sure you want to delete this publisher?';

  @override
  String get publisherDeleteIrreversible => 'This action cannot be undone.';

  @override
  String get publisherPageTitle => 'Publishers';

  @override
  String get publisherCreateSuccess => 'Publisher registered successfully!';

  @override
  String get publisherCreateError => 'Error registering publisher.';

  @override
  String get publisherUpdateSuccess => 'Publisher updated successfully!';

  @override
  String get publisherUpdateError => 'Error updating publisher.';

  @override
  String get publisherDeleteSuccess => 'Publisher deleted successfully!';

  @override
  String get publisherDeleteError => 'Error deleting publisher.';

  @override
  String get publisherNoResults => 'No publishers found.';

  @override
  String get publisherLoadError => 'Could not load publishers.';

  @override
  String get bookLoadPublisherError => 'Could not load the current publisher.';

  @override
  String get bookSearchPublisherError => 'Could not search for publishers.';

  @override
  String get bookSelectPublisherError => 'Select a publisher.';

  @override
  String get bookNoPublishersFound => 'No publishers found.';

  @override
  String fieldRequired(String field) {
    return '$field is required.';
  }

  @override
  String get bookIsbnMaxLength => 'The ISBN must have a maximum of 13 digits.';

  @override
  String get bookDateFormat => 'Enter the date in dd/MM/yyyy format.';

  @override
  String get bookDateInvalid => 'Enter a valid date.';

  @override
  String get publisherEditTitle => 'Edit publisher';

  @override
  String get rentalSearchUserHint => 'Search user by name';

  @override
  String get rentalNoUsersFound => 'No users found.';

  @override
  String get rentalSearchBookHint => 'Search book by title';

  @override
  String rentalAvailableStock(int quantity) {
    return 'Available stock: $quantity';
  }

  @override
  String get rentalNoBooksAvailable => 'No available books found.';

  @override
  String get userLoadError => 'Could not load users.';

  @override
  String get userNoResults => 'No users found.';

  @override
  String get userUpdateSuccess => 'User updated successfully!';

  @override
  String userUpdateError(String error) {
    return 'Error updating user: $error';
  }

  @override
  String get userDeleteSuccess => 'User deleted successfully!';

  @override
  String userDeleteError(String error) {
    return 'Error deleting user: $error';
  }

  @override
  String get userEditTitle => 'Edit user';

  @override
  String get settingsLoadError => 'Could not load settings.';

  @override
  String get profile => 'Profile';

  @override
  String get accessibility => 'Accessibility';

  @override
  String get back => 'Back';
}

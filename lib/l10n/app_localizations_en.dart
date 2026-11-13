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
}

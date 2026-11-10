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
      'Our mission is to help you find information about our products conveniently.';

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
}

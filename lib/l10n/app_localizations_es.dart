// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Biblioteca';

  @override
  String get welcome => '¡Bienvenido!';

  @override
  String get loginDescription => 'Inicia sesión para acceder a tu biblioteca';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get forgotPassword => 'Olvidé mi contraseña';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get register => 'Regístrate';

  @override
  String get or => 'o';

  @override
  String get aboutUs => 'Sobre nosotros';

  @override
  String get aboutDescription =>
      'Nuestra misión es ayudarte a encontrar información sobre nuestros productos de forma práctica.';

  @override
  String get contactUs => 'Contáctanos';

  @override
  String get ourLocations => 'Nuestras ubicaciones';

  @override
  String get locationOne => 'Rua Padre Filho, 263 - Centro.';

  @override
  String get locationTwo => 'Rua IV, 60 - Paulista.';

  @override
  String get locationThree => 'Rua Norte Europeu, 110 - Vale Central.';
}

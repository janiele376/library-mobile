// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Biblioteca';

  @override
  String get welcome => 'Bem Vindo!';

  @override
  String get loginDescription => 'Faça login para acessar sua biblioteca';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Senha';

  @override
  String get forgotPassword => 'Esqueci Senha';

  @override
  String get login => 'Entrar';

  @override
  String get register => 'Cadastre-se';

  @override
  String get or => 'ou';

  @override
  String get aboutUs => 'Sobre Nós';

  @override
  String get aboutDescription =>
      'Nossa missão é informar você aos seus produtos com praticidade.';

  @override
  String get contactUs => 'Contate-nos';

  @override
  String get ourLocations => 'Nossos Locais';

  @override
  String get locationOne => 'Rua Padre Filho, 263 - Centro.';

  @override
  String get locationTwo => 'Rua IV, 60 - Paulista.';

  @override
  String get locationThree => 'Rua Norte Europeu, 110 - Vale Central.';
}

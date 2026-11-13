import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'Biblioteca'**
  String get appTitle;

  /// No description provided for @welcome.
  ///
  /// In pt, this message translates to:
  /// **'Bem Vindo!'**
  String get welcome;

  /// No description provided for @loginDescription.
  ///
  /// In pt, this message translates to:
  /// **'Faça login para acessar sua biblioteca'**
  String get loginDescription;

  /// No description provided for @email.
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get email;

  /// No description provided for @password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In pt, this message translates to:
  /// **'Esqueci Senha'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get login;

  /// No description provided for @register.
  ///
  /// In pt, this message translates to:
  /// **'Cadastre-se'**
  String get register;

  /// No description provided for @or.
  ///
  /// In pt, this message translates to:
  /// **'ou'**
  String get or;

  /// No description provided for @aboutUs.
  ///
  /// In pt, this message translates to:
  /// **'Sobre Nós'**
  String get aboutUs;

  /// No description provided for @aboutDescription.
  ///
  /// In pt, this message translates to:
  /// **'Nossa missão é informar você aos seus produtos com praticidade.'**
  String get aboutDescription;

  /// No description provided for @contactUs.
  ///
  /// In pt, this message translates to:
  /// **'Contate-nos'**
  String get contactUs;

  /// No description provided for @ourLocations.
  ///
  /// In pt, this message translates to:
  /// **'Nossos Locais'**
  String get ourLocations;

  /// No description provided for @locationOne.
  ///
  /// In pt, this message translates to:
  /// **'Rua Padre Filho, 263 - Centro.'**
  String get locationOne;

  /// No description provided for @locationTwo.
  ///
  /// In pt, this message translates to:
  /// **'Rua IV, 60 - Paulista.'**
  String get locationTwo;

  /// No description provided for @locationThree.
  ///
  /// In pt, this message translates to:
  /// **'Rua Norte Europeu, 110 - Vale Central.'**
  String get locationThree;

  /// No description provided for @createAccount.
  ///
  /// In pt, this message translates to:
  /// **'Criar Conta'**
  String get createAccount;

  /// No description provided for @registerTitle.
  ///
  /// In pt, this message translates to:
  /// **'Cadastro'**
  String get registerTitle;

  /// No description provided for @registerDescription.
  ///
  /// In pt, this message translates to:
  /// **'Preencha os dados abaixo para criar sua conta.'**
  String get registerDescription;

  /// No description provided for @fullName.
  ///
  /// In pt, this message translates to:
  /// **'Nome completo'**
  String get fullName;

  /// No description provided for @birthDateHint.
  ///
  /// In pt, this message translates to:
  /// **'DD/MM/AAAA'**
  String get birthDateHint;

  /// No description provided for @emailHint.
  ///
  /// In pt, this message translates to:
  /// **'Usuario@gmail.com'**
  String get emailHint;

  /// No description provided for @cpfHint.
  ///
  /// In pt, this message translates to:
  /// **'000.000.000-00'**
  String get cpfHint;

  /// No description provided for @phoneHint.
  ///
  /// In pt, this message translates to:
  /// **'+99 99999-9999'**
  String get phoneHint;

  /// No description provided for @addressHint.
  ///
  /// In pt, this message translates to:
  /// **'Logradouro, Nº - Bairro'**
  String get addressHint;

  /// No description provided for @confirmPassword.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar senha'**
  String get confirmPassword;

  /// No description provided for @registerAction.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar'**
  String get registerAction;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In pt, this message translates to:
  /// **'Já possui uma conta? Entrar'**
  String get alreadyHaveAccount;

  /// No description provided for @cancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @requiredField.
  ///
  /// In pt, this message translates to:
  /// **'Campo obrigatório'**
  String get requiredField;

  /// No description provided for @invalidEmail.
  ///
  /// In pt, this message translates to:
  /// **'Informe um e-mail válido'**
  String get invalidEmail;

  /// No description provided for @passwordMinLength.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve ter pelo menos 8 caracteres'**
  String get passwordMinLength;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In pt, this message translates to:
  /// **'As senhas não coincidem'**
  String get passwordsDoNotMatch;

  /// No description provided for @loginTitle.
  ///
  /// In pt, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In pt, this message translates to:
  /// **'Recuperar Senha'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDescription.
  ///
  /// In pt, this message translates to:
  /// **'Informe suas credenciais para recuperar o acesso.'**
  String get forgotPasswordDescription;

  /// No description provided for @newPassword.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get newPassword;

  /// No description provided for @recoverPassword.
  ///
  /// In pt, this message translates to:
  /// **'Recuperar'**
  String get recoverPassword;

  /// No description provided for @connectionTimeout.
  ///
  /// In pt, this message translates to:
  /// **'Tempo de conexão esgotado.'**
  String get connectionTimeout;

  /// No description provided for @serverConnectionError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível conectar ao servidor.'**
  String get serverConnectionError;

  /// No description provided for @invalidCredentials.
  ///
  /// In pt, this message translates to:
  /// **'E-mail ou senha inválidos.'**
  String get invalidCredentials;

  /// No description provided for @loginError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível realizar o login. Tente novamente.'**
  String get loginError;

  /// No description provided for @registerSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Conta criada com sucesso!'**
  String get registerSuccess;

  /// No description provided for @registerError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível criar a conta. Verifique os dados ou se o e-mail/CPF já está cadastrado.'**
  String get registerError;

  /// No description provided for @passwordRecoverySuccess.
  ///
  /// In pt, this message translates to:
  /// **'Senha alterada com sucesso!'**
  String get passwordRecoverySuccess;

  /// No description provided for @passwordRecoveryError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível alterar a senha. Verifique os dados.'**
  String get passwordRecoveryError;

  /// No description provided for @invalidName.
  ///
  /// In pt, this message translates to:
  /// **'Informe um nome válido'**
  String get invalidName;

  /// No description provided for @invalidCpf.
  ///
  /// In pt, this message translates to:
  /// **'CPF inválido'**
  String get invalidCpf;

  /// No description provided for @invalidPhone.
  ///
  /// In pt, this message translates to:
  /// **'Telefone inválido. Informe o DDD.'**
  String get invalidPhone;

  /// No description provided for @invalidBirthDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de nascimento inválida'**
  String get invalidBirthDate;

  /// No description provided for @invalidAddress.
  ///
  /// In pt, this message translates to:
  /// **'Informe um endereço válido'**
  String get invalidAddress;

  /// No description provided for @dashboardTitle.
  ///
  /// In pt, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardGlobalStats.
  ///
  /// In pt, this message translates to:
  /// **'Quantitativos Globais'**
  String get dashboardGlobalStats;

  /// No description provided for @dashboardTotalRentals.
  ///
  /// In pt, this message translates to:
  /// **'Aluguéis Realizados'**
  String get dashboardTotalRentals;

  /// No description provided for @dashboardTotalBooks.
  ///
  /// In pt, this message translates to:
  /// **'Livros Cadastrados'**
  String get dashboardTotalBooks;

  /// No description provided for @dashboardTotalPublishers.
  ///
  /// In pt, this message translates to:
  /// **'Editoras Cadastradas'**
  String get dashboardTotalPublishers;

  /// No description provided for @dashboardRentalStatus.
  ///
  /// In pt, this message translates to:
  /// **'Status dos Aluguéis'**
  String get dashboardRentalStatus;

  /// No description provided for @dashboardOnTime.
  ///
  /// In pt, this message translates to:
  /// **'Em Dia'**
  String get dashboardOnTime;

  /// No description provided for @dashboardNearDue.
  ///
  /// In pt, this message translates to:
  /// **'Perto do Vencimento'**
  String get dashboardNearDue;

  /// No description provided for @dashboardOverdue.
  ///
  /// In pt, this message translates to:
  /// **'Atrasado'**
  String get dashboardOverdue;

  /// No description provided for @dashboardLastRentals.
  ///
  /// In pt, this message translates to:
  /// **'Últimos Livros Alugados'**
  String get dashboardLastRentals;

  /// No description provided for @dashboardMostRentedBook.
  ///
  /// In pt, this message translates to:
  /// **'Livro Mais Alugado'**
  String get dashboardMostRentedBook;

  /// No description provided for @dashboardAvailableBooks.
  ///
  /// In pt, this message translates to:
  /// **'Livros Disponíveis'**
  String get dashboardAvailableBooks;

  /// No description provided for @dashboardTotalAvailableBooks.
  ///
  /// In pt, this message translates to:
  /// **'Total de livros: {count}'**
  String dashboardTotalAvailableBooks(int count);

  /// No description provided for @dashboardPublisher.
  ///
  /// In pt, this message translates to:
  /// **'Editora'**
  String get dashboardPublisher;

  /// No description provided for @dashboardReleaseDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de Lançamento'**
  String get dashboardReleaseDate;

  /// No description provided for @dashboardQuantity.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get dashboardQuantity;

  /// No description provided for @dashboardRentalQuantity.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade de Aluguéis'**
  String get dashboardRentalQuantity;

  /// No description provided for @dashboardNoRentals.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum empréstimo encontrado.'**
  String get dashboardNoRentals;

  /// No description provided for @dashboardNoBooks.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum livro encontrado.'**
  String get dashboardNoBooks;

  /// No description provided for @dashboardNoAvailableBooks.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum livro disponível.'**
  String get dashboardNoAvailableBooks;

  /// No description provided for @dashboardNoData.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum dado disponível.'**
  String get dashboardNoData;

  /// No description provided for @dashboardLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar a Dashboard.'**
  String get dashboardLoadError;

  /// No description provided for @dashboardRetry.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get dashboardRetry;

  /// No description provided for @dashboardViewMore.
  ///
  /// In pt, this message translates to:
  /// **'VER MAIS'**
  String get dashboardViewMore;

  /// No description provided for @dashboardStatusNearDue.
  ///
  /// In pt, this message translates to:
  /// **'Próximo do vencimento'**
  String get dashboardStatusNearDue;

  /// No description provided for @dashboardAccessibilityUnavailable.
  ///
  /// In pt, this message translates to:
  /// **'Página de acessibilidade em desenvolvimento.'**
  String get dashboardAccessibilityUnavailable;

  /// No description provided for @dashboardProfileUnavailable.
  ///
  /// In pt, this message translates to:
  /// **'Página de perfil ainda não configurada.'**
  String get dashboardProfileUnavailable;

  /// No description provided for @dashboardAdminAreaUnavailable.
  ///
  /// In pt, this message translates to:
  /// **'Área administrativa ainda não configurada.'**
  String get dashboardAdminAreaUnavailable;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

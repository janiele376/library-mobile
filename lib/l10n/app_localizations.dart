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

  /// No description provided for @settingsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get settingsTitle;

  /// No description provided for @accessibilityTitle.
  ///
  /// In pt, this message translates to:
  /// **'Personalize sua experiência'**
  String get accessibilityTitle;

  /// No description provided for @accessibilityDescription.
  ///
  /// In pt, this message translates to:
  /// **'Configure a aparência e a leitura do aplicativo.'**
  String get accessibilityDescription;

  /// No description provided for @accessibilityThemeTitle.
  ///
  /// In pt, this message translates to:
  /// **'Tema do aplicativo'**
  String get accessibilityThemeTitle;

  /// No description provided for @accessibilityThemeDescription.
  ///
  /// In pt, this message translates to:
  /// **'Escolha a aparência do aplicativo.'**
  String get accessibilityThemeDescription;

  /// No description provided for @themeLight.
  ///
  /// In pt, this message translates to:
  /// **'Claro'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In pt, this message translates to:
  /// **'Escuro'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In pt, this message translates to:
  /// **'Seguir sistema'**
  String get themeSystem;

  /// No description provided for @accessibilityFontSizeTitle.
  ///
  /// In pt, this message translates to:
  /// **'Tamanho da fonte'**
  String get accessibilityFontSizeTitle;

  /// No description provided for @accessibilityFontSizeDescription.
  ///
  /// In pt, this message translates to:
  /// **'Ajuste o tamanho dos textos.'**
  String get accessibilityFontSizeDescription;

  /// No description provided for @accessibilityFontSmall.
  ///
  /// In pt, this message translates to:
  /// **'Pequeno'**
  String get accessibilityFontSmall;

  /// No description provided for @accessibilityFontLarge.
  ///
  /// In pt, this message translates to:
  /// **'Grande'**
  String get accessibilityFontLarge;

  /// No description provided for @accessibilityFontPreview.
  ///
  /// In pt, this message translates to:
  /// **'Exemplo de texto para visualizar o tamanho selecionado.'**
  String get accessibilityFontPreview;

  /// No description provided for @accessibilityLanguageTitle.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get accessibilityLanguageTitle;

  /// No description provided for @accessibilityLanguageDescription.
  ///
  /// In pt, this message translates to:
  /// **'Selecione o idioma do aplicativo.'**
  String get accessibilityLanguageDescription;

  /// No description provided for @languagePortuguese.
  ///
  /// In pt, this message translates to:
  /// **'Português'**
  String get languagePortuguese;

  /// No description provided for @languageEnglish.
  ///
  /// In pt, this message translates to:
  /// **'Inglês'**
  String get languageEnglish;

  /// No description provided for @languageSpanish.
  ///
  /// In pt, this message translates to:
  /// **'Espanhol'**
  String get languageSpanish;

  /// No description provided for @phone.
  ///
  /// In pt, this message translates to:
  /// **'Telefone'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In pt, this message translates to:
  /// **'Endereço'**
  String get address;

  /// No description provided for @cpf.
  ///
  /// In pt, this message translates to:
  /// **'CPF'**
  String get cpf;

  /// No description provided for @birthDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de nascimento'**
  String get birthDate;

  /// No description provided for @needHelp.
  ///
  /// In pt, this message translates to:
  /// **'Precisa de ajuda?'**
  String get needHelp;

  /// No description provided for @currentPassword.
  ///
  /// In pt, this message translates to:
  /// **'Senha atual'**
  String get currentPassword;

  /// No description provided for @newPasswordOptional.
  ///
  /// In pt, this message translates to:
  /// **'Nova senha (opcional)'**
  String get newPasswordOptional;

  /// No description provided for @confirmNewPassword.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar nova senha'**
  String get confirmNewPassword;

  /// No description provided for @profileLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar seu perfil.'**
  String get profileLoadError;

  /// No description provided for @retry.
  ///
  /// In pt, this message translates to:
  /// **'Tentar novamente'**
  String get retry;

  /// No description provided for @profileNotFound.
  ///
  /// In pt, this message translates to:
  /// **'Perfil não encontrado.'**
  String get profileNotFound;

  /// No description provided for @profileUpdated.
  ///
  /// In pt, this message translates to:
  /// **'Perfil atualizado com sucesso!'**
  String get profileUpdated;

  /// No description provided for @profileUpdateError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível atualizar. Verifique sua senha atual e tente novamente.'**
  String get profileUpdateError;

  /// No description provided for @editInformation.
  ///
  /// In pt, this message translates to:
  /// **'Editar informações'**
  String get editInformation;

  /// No description provided for @confirm.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar'**
  String get confirm;

  /// No description provided for @requestSent.
  ///
  /// In pt, this message translates to:
  /// **'Solicitação enviada com sucesso!'**
  String get requestSent;

  /// No description provided for @helpEmailRequired.
  ///
  /// In pt, this message translates to:
  /// **'Informe seu e-mail.'**
  String get helpEmailRequired;

  /// No description provided for @helpSubjectRequired.
  ///
  /// In pt, this message translates to:
  /// **'Informe o assunto.'**
  String get helpSubjectRequired;

  /// No description provided for @subject.
  ///
  /// In pt, this message translates to:
  /// **'Assunto'**
  String get subject;

  /// No description provided for @send.
  ///
  /// In pt, this message translates to:
  /// **'Enviar'**
  String get send;

  /// No description provided for @personalInformation.
  ///
  /// In pt, this message translates to:
  /// **'Informações pessoais'**
  String get personalInformation;

  /// No description provided for @menuTitle.
  ///
  /// In pt, this message translates to:
  /// **'MENU'**
  String get menuTitle;

  /// No description provided for @adminAreaTitle.
  ///
  /// In pt, this message translates to:
  /// **'Área do ADM'**
  String get adminAreaTitle;

  /// No description provided for @logout.
  ///
  /// In pt, this message translates to:
  /// **'Sair'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Deseja sair do sistema?'**
  String get logoutConfirmation;

  /// No description provided for @usersTab.
  ///
  /// In pt, this message translates to:
  /// **'Usuários'**
  String get usersTab;

  /// No description provided for @rentalsTab.
  ///
  /// In pt, this message translates to:
  /// **'Aluguéis'**
  String get rentalsTab;

  /// No description provided for @booksTab.
  ///
  /// In pt, this message translates to:
  /// **'Livros'**
  String get booksTab;

  /// No description provided for @publishersTab.
  ///
  /// In pt, this message translates to:
  /// **'Editoras'**
  String get publishersTab;

  /// No description provided for @adminSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar...'**
  String get adminSearchHint;

  /// No description provided for @filters.
  ///
  /// In pt, this message translates to:
  /// **'Filtros'**
  String get filters;

  /// No description provided for @previousPage.
  ///
  /// In pt, this message translates to:
  /// **'Página anterior'**
  String get previousPage;

  /// No description provided for @nextPage.
  ///
  /// In pt, this message translates to:
  /// **'Próxima página'**
  String get nextPage;

  /// No description provided for @view.
  ///
  /// In pt, this message translates to:
  /// **'Visualizar'**
  String get view;

  /// No description provided for @edit.
  ///
  /// In pt, this message translates to:
  /// **'Editar'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In pt, this message translates to:
  /// **'Excluir'**
  String get delete;

  /// No description provided for @renew.
  ///
  /// In pt, this message translates to:
  /// **'Renovar'**
  String get renew;

  /// No description provided for @returnBook.
  ///
  /// In pt, this message translates to:
  /// **'Devolver'**
  String get returnBook;

  /// No description provided for @userName.
  ///
  /// In pt, this message translates to:
  /// **'Nome do Usuário'**
  String get userName;

  /// No description provided for @actions.
  ///
  /// In pt, this message translates to:
  /// **'Ações'**
  String get actions;

  /// No description provided for @save.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get save;

  /// No description provided for @cnpj.
  ///
  /// In pt, this message translates to:
  /// **'CNPJ'**
  String get cnpj;

  /// No description provided for @publisherName.
  ///
  /// In pt, this message translates to:
  /// **'Nome da editora'**
  String get publisherName;

  /// No description provided for @bookTitle.
  ///
  /// In pt, this message translates to:
  /// **'Título do livro'**
  String get bookTitle;

  /// No description provided for @bookIsbn.
  ///
  /// In pt, this message translates to:
  /// **'ISBN'**
  String get bookIsbn;

  /// No description provided for @bookGenre.
  ///
  /// In pt, this message translates to:
  /// **'Gênero'**
  String get bookGenre;

  /// No description provided for @bookPublisher.
  ///
  /// In pt, this message translates to:
  /// **'Editora'**
  String get bookPublisher;

  /// No description provided for @bookReleaseDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de lançamento'**
  String get bookReleaseDate;

  /// No description provided for @bookQuantity.
  ///
  /// In pt, this message translates to:
  /// **'Quantidade'**
  String get bookQuantity;

  /// No description provided for @bookCreateTitle.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar livro'**
  String get bookCreateTitle;

  /// No description provided for @bookEditTitle.
  ///
  /// In pt, this message translates to:
  /// **'Editar livro'**
  String get bookEditTitle;

  /// No description provided for @bookDeleteTitle.
  ///
  /// In pt, this message translates to:
  /// **'Excluir livro'**
  String get bookDeleteTitle;

  /// No description provided for @bookDeleteConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Tem certeza de que deseja excluir este livro?'**
  String get bookDeleteConfirmation;

  /// No description provided for @bookSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar por título, gênero ou ISBN'**
  String get bookSearchHint;

  /// No description provided for @bookLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os livros.'**
  String get bookLoadError;

  /// No description provided for @bookCreateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Livro cadastrado com sucesso!'**
  String get bookCreateSuccess;

  /// No description provided for @bookUpdateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Livro atualizado com sucesso!'**
  String get bookUpdateSuccess;

  /// No description provided for @bookDeleteSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Livro excluído com sucesso.'**
  String get bookDeleteSuccess;

  /// No description provided for @bookPublisherRequired.
  ///
  /// In pt, this message translates to:
  /// **'Selecione uma editora.'**
  String get bookPublisherRequired;

  /// No description provided for @bookQuantityRequired.
  ///
  /// In pt, this message translates to:
  /// **'Informe a quantidade.'**
  String get bookQuantityRequired;

  /// No description provided for @bookQuantityInvalid.
  ///
  /// In pt, this message translates to:
  /// **'A quantidade não pode ser negativa.'**
  String get bookQuantityInvalid;

  /// No description provided for @noResults.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum livro encontrado.'**
  String get noResults;

  /// No description provided for @rentalTitle.
  ///
  /// In pt, this message translates to:
  /// **'Aluguel'**
  String get rentalTitle;

  /// No description provided for @rentalUser.
  ///
  /// In pt, this message translates to:
  /// **'Usuário'**
  String get rentalUser;

  /// No description provided for @rentalBook.
  ///
  /// In pt, this message translates to:
  /// **'Livro'**
  String get rentalBook;

  /// No description provided for @rentalStartDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de início'**
  String get rentalStartDate;

  /// No description provided for @rentalEndDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de devolução'**
  String get rentalEndDate;

  /// No description provided for @rentalStatus.
  ///
  /// In pt, this message translates to:
  /// **'Status'**
  String get rentalStatus;

  /// No description provided for @rentalCreateTitle.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar aluguel'**
  String get rentalCreateTitle;

  /// No description provided for @rentalEditTitle.
  ///
  /// In pt, this message translates to:
  /// **'Editar aluguel'**
  String get rentalEditTitle;

  /// No description provided for @rentalDeleteTitle.
  ///
  /// In pt, this message translates to:
  /// **'Excluir aluguel'**
  String get rentalDeleteTitle;

  /// No description provided for @rentalDeleteConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Tem certeza de que deseja excluir este aluguel?'**
  String get rentalDeleteConfirmation;

  /// No description provided for @rentalSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar por usuário ou livro...'**
  String get rentalSearchHint;

  /// No description provided for @rentalLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar aluguéis.'**
  String get rentalLoadError;

  /// No description provided for @rentalCreateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Aluguel cadastrado com sucesso!'**
  String get rentalCreateSuccess;

  /// No description provided for @rentalUpdateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Aluguel atualizado com sucesso!'**
  String get rentalUpdateSuccess;

  /// No description provided for @rentalDeleteSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Aluguel excluído com sucesso!'**
  String get rentalDeleteSuccess;

  /// No description provided for @rentalRenewSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Aluguel renovado com sucesso!'**
  String get rentalRenewSuccess;

  /// No description provided for @rentalReturnSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Livro devolvido com sucesso!'**
  String get rentalReturnSuccess;

  /// No description provided for @rentalUserRequired.
  ///
  /// In pt, this message translates to:
  /// **'Selecione um usuário.'**
  String get rentalUserRequired;

  /// No description provided for @rentalBookRequired.
  ///
  /// In pt, this message translates to:
  /// **'Selecione um livro.'**
  String get rentalBookRequired;

  /// No description provided for @rentalRenewConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Deseja renovar este aluguel?'**
  String get rentalRenewConfirmation;

  /// No description provided for @rentalReturnConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Deseja confirmar a devolução deste livro?'**
  String get rentalReturnConfirmation;

  /// No description provided for @rentalNoResults.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum aluguel encontrado.'**
  String get rentalNoResults;

  /// No description provided for @rentalStatusActive.
  ///
  /// In pt, this message translates to:
  /// **'Ativo'**
  String get rentalStatusActive;

  /// No description provided for @rentalStatusDueSoon.
  ///
  /// In pt, this message translates to:
  /// **'Próximo do vencimento'**
  String get rentalStatusDueSoon;

  /// No description provided for @rentalStatusLate.
  ///
  /// In pt, this message translates to:
  /// **'Atrasado'**
  String get rentalStatusLate;

  /// No description provided for @rentalStatusReturned.
  ///
  /// In pt, this message translates to:
  /// **'Devolvido'**
  String get rentalStatusReturned;

  /// No description provided for @userDeleteTitle.
  ///
  /// In pt, this message translates to:
  /// **'Excluir usuário'**
  String get userDeleteTitle;

  /// No description provided for @userDeleteConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Tem certeza de que deseja excluir este usuário?'**
  String get userDeleteConfirmation;

  /// No description provided for @userDeleteIrreversible.
  ///
  /// In pt, this message translates to:
  /// **'Essa ação não poderá ser desfeita.'**
  String get userDeleteIrreversible;

  /// No description provided for @rentalEditSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Altere o usuário ou o livro do aluguel'**
  String get rentalEditSubtitle;

  /// No description provided for @close.
  ///
  /// In pt, this message translates to:
  /// **'Fechar'**
  String get close;

  /// No description provided for @rentalDeleteIrreversible.
  ///
  /// In pt, this message translates to:
  /// **'Essa ação não poderá ser desfeita.'**
  String get rentalDeleteIrreversible;

  /// No description provided for @rentalCreateSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Selecione o usuário e o livro'**
  String get rentalCreateSubtitle;

  /// No description provided for @bookDeleteIrreversible.
  ///
  /// In pt, this message translates to:
  /// **'Essa ação não poderá ser desfeita.'**
  String get bookDeleteIrreversible;

  /// No description provided for @bookCreateSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Preencha os dados do novo livro'**
  String get bookCreateSubtitle;

  /// No description provided for @publisherCreateTitle.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar editora'**
  String get publisherCreateTitle;

  /// No description provided for @publisherCreateSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Preencha os dados da nova editora'**
  String get publisherCreateSubtitle;

  /// No description provided for @publisherDeleteTitle.
  ///
  /// In pt, this message translates to:
  /// **'Excluir editora'**
  String get publisherDeleteTitle;

  /// No description provided for @publisherDeleteConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Tem certeza de que deseja excluir esta editora?'**
  String get publisherDeleteConfirmation;

  /// No description provided for @publisherDeleteIrreversible.
  ///
  /// In pt, this message translates to:
  /// **'Essa ação não poderá ser desfeita.'**
  String get publisherDeleteIrreversible;

  /// No description provided for @publisherPageTitle.
  ///
  /// In pt, this message translates to:
  /// **'Editoras'**
  String get publisherPageTitle;

  /// No description provided for @publisherCreateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Editora cadastrada com sucesso!'**
  String get publisherCreateSuccess;

  /// No description provided for @publisherCreateError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao cadastrar editora.'**
  String get publisherCreateError;

  /// No description provided for @publisherUpdateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Editora atualizada com sucesso!'**
  String get publisherUpdateSuccess;

  /// No description provided for @publisherUpdateError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao atualizar editora.'**
  String get publisherUpdateError;

  /// No description provided for @publisherDeleteSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Editora excluída com sucesso!'**
  String get publisherDeleteSuccess;

  /// No description provided for @publisherDeleteError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao excluir editora.'**
  String get publisherDeleteError;

  /// No description provided for @publisherNoResults.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma editora encontrada.'**
  String get publisherNoResults;

  /// No description provided for @publisherLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar as editoras.'**
  String get publisherLoadError;

  /// No description provided for @bookLoadPublisherError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar a editora atual.'**
  String get bookLoadPublisherError;

  /// No description provided for @bookSearchPublisherError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível pesquisar editoras.'**
  String get bookSearchPublisherError;

  /// No description provided for @bookSelectPublisherError.
  ///
  /// In pt, this message translates to:
  /// **'Selecione uma editora.'**
  String get bookSelectPublisherError;

  /// No description provided for @bookNoPublishersFound.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma editora encontrada.'**
  String get bookNoPublishersFound;

  /// No description provided for @fieldRequired.
  ///
  /// In pt, this message translates to:
  /// **'{field} é obrigatório.'**
  String fieldRequired(String field);

  /// No description provided for @bookIsbnMaxLength.
  ///
  /// In pt, this message translates to:
  /// **'O ISBN deve ter no máximo 13 dígitos.'**
  String get bookIsbnMaxLength;

  /// No description provided for @bookDateFormat.
  ///
  /// In pt, this message translates to:
  /// **'Informe a data no formato dd/MM/aaaa.'**
  String get bookDateFormat;

  /// No description provided for @bookDateInvalid.
  ///
  /// In pt, this message translates to:
  /// **'Informe uma data válida.'**
  String get bookDateInvalid;

  /// No description provided for @publisherEditTitle.
  ///
  /// In pt, this message translates to:
  /// **'Editar editora'**
  String get publisherEditTitle;

  /// No description provided for @rentalSearchUserHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar usuário pelo nome'**
  String get rentalSearchUserHint;

  /// No description provided for @rentalNoUsersFound.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum usuário encontrado.'**
  String get rentalNoUsersFound;

  /// No description provided for @rentalSearchBookHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar livro pelo título'**
  String get rentalSearchBookHint;

  /// No description provided for @rentalAvailableStock.
  ///
  /// In pt, this message translates to:
  /// **'Estoque disponível: {quantity}'**
  String rentalAvailableStock(int quantity);

  /// No description provided for @rentalNoBooksAvailable.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum livro disponível encontrado.'**
  String get rentalNoBooksAvailable;

  /// No description provided for @userLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar os usuários.'**
  String get userLoadError;

  /// No description provided for @userNoResults.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum usuário encontrado.'**
  String get userNoResults;

  /// No description provided for @userUpdateSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Usuário atualizado com sucesso!'**
  String get userUpdateSuccess;

  /// No description provided for @userUpdateError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao atualizar usuário: {error}'**
  String userUpdateError(String error);

  /// No description provided for @userDeleteSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Usuário excluído com sucesso!'**
  String get userDeleteSuccess;

  /// No description provided for @userDeleteError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao excluir usuário: {error}'**
  String userDeleteError(String error);

  /// No description provided for @userEditTitle.
  ///
  /// In pt, this message translates to:
  /// **'Editar usuário'**
  String get userEditTitle;

  /// No description provided for @settingsLoadError.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível carregar as configurações.'**
  String get settingsLoadError;

  /// No description provided for @profile.
  ///
  /// In pt, this message translates to:
  /// **'Perfil'**
  String get profile;

  /// No description provided for @accessibility.
  ///
  /// In pt, this message translates to:
  /// **'Acessibilidade'**
  String get accessibility;

  /// No description provided for @back.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get back;
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

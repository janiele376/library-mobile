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

  @override
  String get createAccount => 'Criar Conta';

  @override
  String get registerTitle => 'Cadastro';

  @override
  String get registerDescription =>
      'Preencha os dados abaixo para criar sua conta.';

  @override
  String get fullName => 'Nome completo';

  @override
  String get birthDateHint => 'DD/MM/AAAA';

  @override
  String get emailHint => 'Usuario@gmail.com';

  @override
  String get cpfHint => '000.000.000-00';

  @override
  String get phoneHint => '+99 99999-9999';

  @override
  String get addressHint => 'Logradouro, Nº - Bairro';

  @override
  String get confirmPassword => 'Confirmar senha';

  @override
  String get registerAction => 'Cadastrar';

  @override
  String get alreadyHaveAccount => 'Já possui uma conta? Entrar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get requiredField => 'Campo obrigatório';

  @override
  String get invalidEmail => 'Informe um e-mail válido';

  @override
  String get passwordMinLength => 'A senha deve ter pelo menos 8 caracteres';

  @override
  String get passwordsDoNotMatch => 'As senhas não coincidem';

  @override
  String get loginTitle => 'Login';

  @override
  String get forgotPasswordTitle => 'Recuperar Senha';

  @override
  String get forgotPasswordDescription =>
      'Informe suas credenciais para recuperar o acesso.';

  @override
  String get newPassword => 'Senha';

  @override
  String get recoverPassword => 'Recuperar';

  @override
  String get connectionTimeout => 'Tempo de conexão esgotado.';

  @override
  String get serverConnectionError => 'Não foi possível conectar ao servidor.';

  @override
  String get invalidCredentials => 'E-mail ou senha inválidos.';

  @override
  String get loginError =>
      'Não foi possível realizar o login. Tente novamente.';

  @override
  String get registerSuccess => 'Conta criada com sucesso!';

  @override
  String get registerError =>
      'Não foi possível criar a conta. Verifique os dados ou se o e-mail/CPF já está cadastrado.';

  @override
  String get passwordRecoverySuccess => 'Senha alterada com sucesso!';

  @override
  String get passwordRecoveryError =>
      'Não foi possível alterar a senha. Verifique os dados.';

  @override
  String get invalidName => 'Informe um nome válido';

  @override
  String get invalidCpf => 'CPF inválido';

  @override
  String get invalidPhone => 'Telefone inválido. Informe o DDD.';

  @override
  String get invalidBirthDate => 'Data de nascimento inválida';

  @override
  String get invalidAddress => 'Informe um endereço válido';
}

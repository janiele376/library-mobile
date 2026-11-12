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
  String get aboutUs => 'Sobre Nosotros';

  @override
  String get aboutDescription =>
      'Nuestra misión es informarte sobre nuestros productos de manera práctica.';

  @override
  String get contactUs => 'Contáctanos';

  @override
  String get ourLocations => 'Nuestras Ubicaciones';

  @override
  String get locationOne => 'Rua Padre Filho, 263 - Centro.';

  @override
  String get locationTwo => 'Rua IV, 60 - Paulista.';

  @override
  String get locationThree => 'Rua Norte Europeu, 110 - Vale Central.';

  @override
  String get createAccount => 'Crear Cuenta';

  @override
  String get registerTitle => 'Registro';

  @override
  String get registerDescription =>
      'Completa los datos a continuación para crear tu cuenta.';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get birthDateHint => 'DD/MM/AAAA';

  @override
  String get emailHint => 'usuario@gmail.com';

  @override
  String get cpfHint => '000.000.000-00';

  @override
  String get phoneHint => '+99 99999-9999';

  @override
  String get addressHint => 'Calle, Número - Barrio';

  @override
  String get confirmPassword => 'Confirmar contraseña';

  @override
  String get registerAction => 'Registrarse';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta? Inicia sesión';

  @override
  String get cancel => 'Cancelar';

  @override
  String get requiredField => 'Campo obligatorio';

  @override
  String get invalidEmail => 'Introduce un correo electrónico válido';

  @override
  String get passwordMinLength =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get passwordsDoNotMatch => 'Las contraseñas no coinciden';

  @override
  String get loginTitle => 'Inicio de sesión';

  @override
  String get forgotPasswordTitle => 'Recuperar Contraseña';

  @override
  String get forgotPasswordDescription =>
      'Introduce tus credenciales para recuperar el acceso.';

  @override
  String get newPassword => 'Contraseña';

  @override
  String get recoverPassword => 'Recuperar';

  @override
  String get connectionTimeout => 'Se agotó el tiempo de conexión.';

  @override
  String get serverConnectionError => 'No se pudo conectar al servidor.';

  @override
  String get invalidCredentials =>
      'Correo electrónico o contraseña incorrectos.';

  @override
  String get loginError => 'No se pudo iniciar sesión. Inténtalo de nuevo.';

  @override
  String get registerSuccess => '¡Cuenta creada correctamente!';

  @override
  String get registerError =>
      'No se pudo crear la cuenta. Revisa los datos o si el correo/CPF ya está registrado.';

  @override
  String get passwordRecoverySuccess => '¡Contraseña cambiada correctamente!';

  @override
  String get passwordRecoveryError =>
      'No se pudo cambiar la contraseña. Revisa tus datos.';

  @override
  String get invalidName => 'Introduce un nombre válido';

  @override
  String get invalidCpf => 'CPF inválido';

  @override
  String get invalidPhone => 'Teléfono inválido. Incluye el código de área.';

  @override
  String get invalidBirthDate => 'Fecha de nacimiento inválida';

  @override
  String get invalidAddress => 'Introduce una dirección válida';
}

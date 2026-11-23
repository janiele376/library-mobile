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

  @override
  String get dashboardTitle => 'Panel de control';

  @override
  String get dashboardGlobalStats => 'Estadísticas generales';

  @override
  String get dashboardTotalRentals => 'Préstamos realizados';

  @override
  String get dashboardTotalBooks => 'Libros registrados';

  @override
  String get dashboardTotalPublishers => 'Editoriales registradas';

  @override
  String get dashboardRentalStatus => 'Estado de los préstamos';

  @override
  String get dashboardOnTime => 'Al día';

  @override
  String get dashboardNearDue => 'Próximo a vencer';

  @override
  String get dashboardOverdue => 'Vencido';

  @override
  String get dashboardLastRentals => 'Últimos libros prestados';

  @override
  String get dashboardMostRentedBook => 'Libro más prestado';

  @override
  String get dashboardAvailableBooks => 'Libros disponibles';

  @override
  String dashboardTotalAvailableBooks(int count) {
    return 'Total de libros: $count';
  }

  @override
  String get dashboardPublisher => 'Editorial';

  @override
  String get dashboardReleaseDate => 'Fecha de publicación';

  @override
  String get dashboardQuantity => 'Cantidad';

  @override
  String get dashboardRentalQuantity => 'Cantidad de préstamos';

  @override
  String get dashboardNoRentals => 'No se encontraron préstamos.';

  @override
  String get dashboardNoBooks => 'No se encontraron libros.';

  @override
  String get dashboardNoAvailableBooks => 'No hay libros disponibles.';

  @override
  String get dashboardNoData => 'No hay datos disponibles.';

  @override
  String get dashboardLoadError => 'No se pudo cargar el panel de control.';

  @override
  String get dashboardRetry => 'Intentar de nuevo';

  @override
  String get dashboardViewMore => 'VER MÁS';

  @override
  String get dashboardStatusNearDue => 'Próximo a la fecha de vencimiento';

  @override
  String get dashboardAccessibilityUnavailable =>
      'La página de accesibilidad está en desarrollo.';

  @override
  String get dashboardProfileUnavailable =>
      'La página de perfil aún no está configurada.';

  @override
  String get dashboardAdminAreaUnavailable =>
      'El área administrativa aún no está configurada.';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get accessibilityTitle => 'Personaliza tu experiencia';

  @override
  String get accessibilityDescription =>
      'Configura la apariencia y la lectura de la aplicación.';

  @override
  String get accessibilityThemeTitle => 'Tema de la aplicación';

  @override
  String get accessibilityThemeDescription =>
      'Elige la apariencia de la aplicación.';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get themeSystem => 'Seguir el sistema';

  @override
  String get accessibilityFontSizeTitle => 'Tamaño de fuente';

  @override
  String get accessibilityFontSizeDescription => 'Ajusta el tamaño del texto.';

  @override
  String get accessibilityFontSmall => 'Pequeño';

  @override
  String get accessibilityFontLarge => 'Grande';

  @override
  String get accessibilityFontPreview =>
      'Ejemplo de texto para visualizar el tamaño seleccionado.';

  @override
  String get accessibilityLanguageTitle => 'Idioma';

  @override
  String get accessibilityLanguageDescription =>
      'Selecciona el idioma de la aplicación.';

  @override
  String get languagePortuguese => 'Portugués';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get phone => 'Teléfono';

  @override
  String get address => 'Dirección';

  @override
  String get cpf => 'CPF';

  @override
  String get birthDate => 'Fecha de nacimiento';

  @override
  String get needHelp => '¿Necesitas ayuda?';

  @override
  String get currentPassword => 'Contraseña actual';

  @override
  String get newPasswordOptional => 'Nueva contraseña (opcional)';

  @override
  String get confirmNewPassword => 'Confirmar nueva contraseña';

  @override
  String get profileLoadError => 'No se pudo cargar tu perfil.';

  @override
  String get retry => 'Intentar de nuevo';

  @override
  String get profileNotFound => 'Perfil no encontrado.';

  @override
  String get profileUpdated => '¡Perfil actualizado correctamente!';

  @override
  String get profileUpdateError =>
      'No se pudo actualizar. Comprueba tu contraseña actual e inténtalo de nuevo.';

  @override
  String get editInformation => 'Editar información';

  @override
  String get confirm => 'Confirmar';

  @override
  String get requestSent => '¡Solicitud enviada correctamente!';

  @override
  String get helpEmailRequired => 'Introduce tu correo electrónico.';

  @override
  String get helpSubjectRequired => 'Introduce el asunto.';

  @override
  String get subject => 'Asunto';

  @override
  String get send => 'Enviar';

  @override
  String get personalInformation => 'Información personal';

  @override
  String get menuTitle => 'MENÚ';

  @override
  String get adminAreaTitle => 'Área de administración';

  @override
  String get logout => 'Salir';

  @override
  String get logoutConfirmation => '¿Desea salir del sistema?';

  @override
  String get usersTab => 'Usuarios';

  @override
  String get rentalsTab => 'Préstamos';

  @override
  String get booksTab => 'Libros';

  @override
  String get publishersTab => 'Editoriales';

  @override
  String get adminSearchHint => 'Buscar...';

  @override
  String get filters => 'Filtros';

  @override
  String get previousPage => 'Página anterior';

  @override
  String get nextPage => 'Página siguiente';

  @override
  String get view => 'Visualizar';

  @override
  String get edit => 'Editar';

  @override
  String get delete => 'Eliminar';

  @override
  String get renew => 'Renovar';

  @override
  String get returnBook => 'Devolver';

  @override
  String get userName => 'Nombre del usuario';

  @override
  String get actions => 'Acciones';

  @override
  String get save => 'Guardar';

  @override
  String get cnpj => 'CNPJ';

  @override
  String get publisherName => 'Nombre del editor';

  @override
  String get bookTitle => 'Título del libro';

  @override
  String get bookIsbn => 'ISBN';

  @override
  String get bookGenre => 'Género';

  @override
  String get bookPublisher => 'Editorial';

  @override
  String get bookReleaseDate => 'Fecha de publicación';

  @override
  String get bookQuantity => 'Cantidad';

  @override
  String get bookCreateTitle => 'Registrar libro';

  @override
  String get bookEditTitle => 'Editar libro';

  @override
  String get bookDeleteTitle => 'Eliminar libro';

  @override
  String get bookDeleteConfirmation =>
      '¿Está seguro de que desea eliminar este libro?';

  @override
  String get bookSearchHint => 'Buscar por título, género o ISBN';

  @override
  String get bookLoadError => 'No se pudieron cargar los libros.';

  @override
  String get bookCreateSuccess => '¡Libro registrado correctamente!';

  @override
  String get bookUpdateSuccess => '¡Libro actualizado correctamente!';

  @override
  String get bookDeleteSuccess => 'Libro eliminado correctamente.';

  @override
  String get bookPublisherRequired => 'Seleccione una editorial.';

  @override
  String get bookQuantityRequired => 'Ingrese la cantidad.';

  @override
  String get bookQuantityInvalid => 'La cantidad no puede ser negativa.';

  @override
  String get noResults => 'No se encontraron libros.';

  @override
  String get rentalTitle => 'Préstamo';

  @override
  String get rentalUser => 'Usuario';

  @override
  String get rentalBook => 'Libro';

  @override
  String get rentalStartDate => 'Fecha de inicio';

  @override
  String get rentalEndDate => 'Fecha de devolución';

  @override
  String get rentalStatus => 'Estado';

  @override
  String get rentalCreateTitle => 'Registrar préstamo';

  @override
  String get rentalEditTitle => 'Editar préstamo';

  @override
  String get rentalDeleteTitle => 'Eliminar préstamo';

  @override
  String get rentalDeleteConfirmation =>
      '¿Estás seguro de que deseas eliminar este préstamo?';

  @override
  String get rentalSearchHint => 'Buscar por usuario o libro...';

  @override
  String get rentalLoadError => 'Error al cargar los préstamos.';

  @override
  String get rentalCreateSuccess => '¡Préstamo registrado correctamente!';

  @override
  String get rentalUpdateSuccess => '¡Préstamo actualizado correctamente!';

  @override
  String get rentalDeleteSuccess => '¡Préstamo eliminado correctamente!';

  @override
  String get rentalRenewSuccess => '¡Préstamo renovado correctamente!';

  @override
  String get rentalReturnSuccess => '¡Libro devuelto correctamente!';

  @override
  String get rentalUserRequired => 'Selecciona un usuario.';

  @override
  String get rentalBookRequired => 'Selecciona un libro.';

  @override
  String get rentalRenewConfirmation => '¿Deseas renovar este préstamo?';

  @override
  String get rentalReturnConfirmation =>
      '¿Deseas confirmar la devolución de este libro?';

  @override
  String get rentalNoResults => 'No se encontraron préstamos.';

  @override
  String get rentalStatusActive => 'Activo';

  @override
  String get rentalStatusDueSoon => 'Próximo a vencer';

  @override
  String get rentalStatusLate => 'Atrasado';

  @override
  String get rentalStatusReturned => 'Devuelto';

  @override
  String get userDeleteTitle => 'Eliminar usuario';

  @override
  String get userDeleteConfirmation =>
      '¿Está seguro de que desea eliminar este usuario?';

  @override
  String get userDeleteIrreversible => 'Esta acción no se puede deshacer.';

  @override
  String get rentalEditSubtitle => 'Cambie el usuario o el libro del préstamo';

  @override
  String get close => 'Cerrar';

  @override
  String get rentalDeleteIrreversible => 'Esta acción no se puede deshacer.';

  @override
  String get rentalCreateSubtitle => 'Seleccione el usuario y el libro';

  @override
  String get bookDeleteIrreversible => 'Esta acción no se puede deshacer.';

  @override
  String get bookCreateSubtitle => 'Complete los datos del nuevo libro';

  @override
  String get publisherCreateTitle => 'Registrar editorial';

  @override
  String get publisherCreateSubtitle =>
      'Complete los datos de la nueva editorial';

  @override
  String get publisherDeleteTitle => 'Eliminar editorial';

  @override
  String get publisherDeleteConfirmation =>
      '¿Está seguro de que desea eliminar esta editorial?';

  @override
  String get publisherDeleteIrreversible => 'Esta acción no se puede deshacer.';
}

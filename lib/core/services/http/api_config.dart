
class ApiConfig {
  ApiConfig._();

  static const String baseUrl = String.fromEnvironment(
    'http://20.20.1.95:8080',
    defaultValue: 'http://20.20.1.95:8080',
  );
}

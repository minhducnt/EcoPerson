abstract interface class AppEnvironment {
  static const String developmentPath = 'assets/env/.development.env';
  static const String productionPath = 'assets/env/.production.env';

  abstract final String baseUrl;
  abstract final String fileServerUrl;
}

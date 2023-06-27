class ServerException implements Exception {}

class ApplicationException implements Exception {
  ApplicationException(this.message);

  final String message;
}
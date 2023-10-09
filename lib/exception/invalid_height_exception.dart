class InvalidHeightException implements Exception {
  String error() => "Altura inválida!";

  @override
  String toString() {
    return "InvalidHeightException: ${error()}";
  }
}

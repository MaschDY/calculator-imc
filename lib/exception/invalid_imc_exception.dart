class InvalidImcException implements Exception {
  String error() => "IMC Inválido!";

  @override
  String toString() {
    return "InvalidImcException: ${error()}";
  }
}

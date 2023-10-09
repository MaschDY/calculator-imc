class InvalidWeightException implements Exception {
  String error() => "Peso inválido!";

  @override
  String toString() {
    return "InvalidWeightException: ${error()}";
  }
}

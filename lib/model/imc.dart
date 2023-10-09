import '../exception/invalid_imc_exception.dart';

class Imc {
  double _value = 0.0;
  String _classification = "";

  double get value => _value;

  String get classification => _classification;

  static double calculateImc(double weight, double height) =>
      (weight / (height * height)).roundToDouble();

  static String generateClassification(double imc) {
    String classification = "";

    switch (imc) {
      case >= 0 && < 16.0:
        classification = "Magreza Grave";
        break;
      case >= 16.0 && < 17:
        classification = "Magreza Moderada";
        break;
      case >= 17.0 && < 18.5:
        classification = "Magreza Leve";
        break;
      case >= 18.5 && < 25:
        classification = "Saudável";
        break;
      case >= 25 && < 30:
        classification = "Sobrepeso";
        break;
      case >= 30 && < 35:
        classification = "Obesidade Grau I";
        break;
      case >= 35 && < 40:
        classification = "Obesidade Grau II (Severa)";
        break;
      case >= 40:
        classification = "Obesidade Grau III (Mórbida)";
        break;
      default:
        throw InvalidImcException();
    }
    return classification;
  }

  Imc(double weight, double height) {
    _value = calculateImc(weight, height);
    _classification = generateClassification(_value);
  }

  @override
  String toString() {
    return "IMC: $_value, Classificação: $_classification";
  }
}

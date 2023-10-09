import 'package:calculator_imc/exception/invalid_height_exception.dart';
import 'package:calculator_imc/exception/invalid_name_exception.dart';
import 'package:calculator_imc/exception/invalid_weight_exception.dart';
import 'package:flutter/cupertino.dart';

import '../exception/invalid_imc_exception.dart';
import 'imc.dart';

class Person {
  final String _id = UniqueKey().toString();
  String name = "";
  double weight = 0.0;
  double height = 0.0;
  Imc? _imc;

  Person(this.name, this.weight, this.height) {
    validateInputFields(name, weight, height);
    _imc = Imc(weight, height);
  }

  String get id => _id;

  Imc? get imc => _imc;

  void createImc() {
    _imc = Imc(weight, height);
  }

  void validateInputFields(String name, double weight, double height) {
    if (name.trim().isEmpty) {
      throw InvalidNameException();
    } else if (weight <= 0.0 || weight.isNaN) {
      throw InvalidWeightException();
    } else if (height <= 0.0 || height.isNaN) {
      throw InvalidHeightException();
    }
  }

  @override
  String toString() {
    if (_imc == null) {
      throw InvalidImcException();
    }

    return {
      "Nome": name,
      "Peso": weight,
      "Altura": height,
      "IMC": _imc!.value,
      "Classificação IMC": _imc!.classification
    }.toString();
  }
}

import 'package:calculator_imc/repository/person_repository.dart';
import 'package:flutter/material.dart';

import '../../model/person.dart';

class CreateImcPage extends StatefulWidget {
  final PersonRepository personRepository;

  const CreateImcPage({super.key, required this.personRepository});

  @override
  State<CreateImcPage> createState() => _CreateImcPageState();
}

class _CreateImcPageState extends State<CreateImcPage> {
  var nameController = TextEditingController(text: "");
  var weightController = TextEditingController(text: "");
  var heightController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Criar IMC",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Digite o nome"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(hintText: "Digite o peso"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    debugPrint(value);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration:
                      const InputDecoration(hintText: "Digite a altura"),
                ),
              ),
              Container(
                width: double.infinity,
                height: 75,
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text("Criar"),
                  onPressed: () {
                    createPersonAndImc();
                    Navigator.pop(context, true);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createPersonAndImc() {
    var person = Person(
        nameController.text,
        double.parse(weightController.text),
        double.parse(heightController.text));
    widget.personRepository.add(person);
  }
}

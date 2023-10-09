import 'package:calculator_imc/page/imc/create_imc_page.dart';
import 'package:calculator_imc/repository/person_repository.dart';
import 'package:flutter/material.dart';

import '../../model/person.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersonRepository personRepository;
  var persons = <Person>[];

  loadData() async {
    persons = await personRepository.get();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    personRepository = PersonRepository();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calculador de IMC",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            buildPersonsList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToCreatePersonPage(context);
          },
          tooltip: 'Criar IMC',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 10),
      child: const Text(
        "Lista de Pessoas",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }

  Expanded buildPersonsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (_, index) {
          var person = persons[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: buildPersonCard(person),
          );
        },
      ),
    );
  }

  Card buildPersonCard(Person person) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                person.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Peso: ${person.weight.toString()}, Altura: ${person.height.toString()}",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                person.imc.toString(),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToCreatePersonPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateImcPage(
          personRepository: personRepository,
        ),
      ),
    ).then((refreshData) => {if (refreshData) loadData()});
  }
}

import '../model/person.dart';

class PersonRepository {
  final List<Person> _persons = [];

  Future<void> add(Person person) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _persons.add(person);
  }

  Future<void> update(String id, Person person) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _persons.where((savedPerson) => savedPerson.id == id).first
      ..name = person.name
      ..weight = person.weight
      ..height = person.height
      ..createImc();
  }

  Future<List<Person>> get() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _persons;
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _persons.removeWhere((person) => person.id == id);
  }
}

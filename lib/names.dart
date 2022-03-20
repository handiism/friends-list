import 'package:faker/faker.dart';

class _Names {
  final List<String> _names = [];
  _Names() {
    for (var i = 0; i < 20; i++) {
      _names.add(faker.person.name());
    }
  }
}

_Names _names = _Names();
List<String> names = _names._names;

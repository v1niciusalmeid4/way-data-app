import 'package:core/app_way_data_core.dart';

enum CharacterGender {
  female(key: 'Female', label: 'Mulher'),
  male(key: 'Male', label: 'Homem'),
  geanderless(key: 'Genderless', label: 'Sem genero'),
  unknow(key: 'unknow', label: 'Desconhecido');

  const CharacterGender({required this.key, required this.label});

  final String label;
  final String key;

  static CharacterGender fromKey(String key) {
    final status = CharacterGender.values.firstWhereOrNull((e) => e.key == key);

    if (status == null) {
      return unknow;
    }

    return status;
  }
}

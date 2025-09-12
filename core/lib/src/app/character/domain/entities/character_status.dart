import 'package:core/app_way_data_core.dart';

enum CharacterStatus {
  alive(key: 'Alive', label: 'Vivo'),
  dead(key: 'Dead', label: 'Morto'),
  unknow(key: 'unknow', label: 'Desconhecido');

  const CharacterStatus({required this.key, required this.label});

  final String label;
  final String key;

  static CharacterStatus fromKey(String key) {
    final status = CharacterStatus.values.firstWhereOrNull((e) => e.key == key);

    if (status == null) {
      return unknow;
    }
    return status;
  }
}

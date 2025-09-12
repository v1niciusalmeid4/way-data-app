import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

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

class CharacterStatusUIData {
  final Color background;
  final Color foreground;

  CharacterStatusUIData({required this.background, required this.foreground});
}

extension CharacterStatusUI on CharacterStatus {
  CharacterStatusUIData getUIData(BuildContext context) {
    final theme = Theme.of(context);

    switch (this) {
      case CharacterStatus.alive:
        return CharacterStatusUIData(
          background: Colors.green.withValues(alpha: .18),
          foreground: Colors.green.shade800,
        );
      case CharacterStatus.dead:
        return CharacterStatusUIData(
          background: Colors.red.withValues(alpha: .18),
          foreground: Colors.red.shade800,
        );
      default:
        return CharacterStatusUIData(
          background: theme.colorScheme.surfaceContainerHighest,
          foreground: theme.colorScheme.onSurfaceVariant,
        );
    }
  }
}

import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

import 'character_card.dart';

class ListCharacters extends StatelessWidget {
  final List<CharacterEntity> characters;
  final bool reachMax;
  final Function() onFetch;
  final Function() onPullRefresh;
  final Function(int) onCharacterPressed;

  const ListCharacters({
    required this.characters,
    required this.reachMax,
    required this.onFetch,
    required this.onPullRefresh,
    required this.onCharacterPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaginationComponent(
      itemCount: characters.length,
      reachMax: reachMax,
      onFetch: onFetch,
      onPullRefresh: onPullRefresh,
      builder: (context, index) => CharacterCard(
        character: characters[index],
        onCharacterPressed: onCharacterPressed,
      ),
    );
  }
}

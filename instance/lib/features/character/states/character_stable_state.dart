import 'package:core/app_way_data_core.dart';
import 'package:instance/features/character/components/components.dart';

import 'package:flutter/material.dart';

class CharacterStableState extends StatelessWidget {
  final CharacterBloc bloc;
  final Stable state;

  const CharacterStableState({
    super.key,
    required this.bloc,
    required this.state,
  });

  CharacterStableData get data => state.data;
  CharacterEntity get character => data.character;

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewCharacter(
      character: character,
      onBackPressed: () => bloc.dispatchEvent(CharacterBackHomeEvent()),
    );
  }
}

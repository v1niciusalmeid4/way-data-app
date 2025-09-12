import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';

import 'states/character_empty_state.dart';
import 'states/character_error_state.dart';
import 'states/character_loading_state.dart';
import 'states/character_stable_state.dart';

class CharacterPage extends IScreenView<CharacterBloc> {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context, CharacterBloc bloc) {
    return Scaffold(
      body: ScreenStateBuilder(
        bloc: bloc,
        onStable: (context, state) =>
            CharacterStableState(bloc: bloc, state: state),
        onLoading: (context, state) =>
            CharacterLoadingState(bloc: bloc, state: state),
        onEmpty: (context, state) =>
            CharacterEmptyState(bloc: bloc, state: state),
        onError: (context, state) =>
            CharacterErrorState(bloc: bloc, state: state),
      ),
    );
  }
}

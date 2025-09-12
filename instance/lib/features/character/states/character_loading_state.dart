import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class CharacterLoadingState extends StatelessWidget {
  final CharacterBloc bloc;
  final Loading state;

  const CharacterLoadingState({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}

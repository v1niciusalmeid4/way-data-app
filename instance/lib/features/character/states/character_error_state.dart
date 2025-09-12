import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class CharacterErrorState extends StatelessWidget {
  final CharacterBloc bloc;
  final Error state;

  const CharacterErrorState({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

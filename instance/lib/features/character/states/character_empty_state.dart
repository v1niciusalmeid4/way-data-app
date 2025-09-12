import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class CharacterEmptyState extends StatelessWidget {
  final CharacterBloc bloc;
  final Empty state;

  const CharacterEmptyState({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

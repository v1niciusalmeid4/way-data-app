import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class RouterErrorState extends StatelessWidget {
  final RouterBloc bloc;
  final Error state;

  const RouterErrorState({required this.bloc, required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

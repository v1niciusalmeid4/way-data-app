import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  final HomeBloc bloc;
  final Empty state;

  const HomeEmptyState({required this.bloc, required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

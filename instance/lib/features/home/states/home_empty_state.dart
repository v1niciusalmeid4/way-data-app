import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class HomeEmptyState extends StatelessWidget {
  final HomeBloc bloc;
  final Empty state;

  const HomeEmptyState({required this.bloc, required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Nenhum personagem encontrado.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => bloc.dispatchEvent(HomeReloadEvent()),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

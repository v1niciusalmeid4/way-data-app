import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class RouterEmptyState extends StatelessWidget {
  final RouterBloc bloc;
  final Empty state;

  const RouterEmptyState({required this.bloc, required this.state, super.key});

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
                    'Nenhuma rota encontrada.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => bloc.dispatchEvent(RouterReadyEvent()),
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

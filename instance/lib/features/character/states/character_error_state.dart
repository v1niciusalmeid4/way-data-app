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
                    'Ops... Algo deu errado. Tente novamente mais tarde.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(state.message),
                ),
                ElevatedButton.icon(
                  onPressed: () => bloc.dispatchEvent(CharacterReloadEvent()),
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

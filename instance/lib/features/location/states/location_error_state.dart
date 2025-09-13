import 'package:core/app_way_data_core.dart';
import 'package:flutter/material.dart';

class LocationErrorState extends StatelessWidget {
  final LocationBloc bloc;
  final Error state;

  const LocationErrorState({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Localização'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => bloc.dispatchEvent(LocationBackEvent()),
          ),
        ),
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
                  onPressed: () => bloc.dispatchEvent(LocationReloadEvent()),
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

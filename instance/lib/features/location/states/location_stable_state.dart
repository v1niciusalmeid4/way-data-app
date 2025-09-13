import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';

import 'package:instance/features/location/components/location_card.dart';

class LocationStableState extends StatelessWidget {
  final LocationBloc bloc;
  final Stable state;

  const LocationStableState({
    super.key,
    required this.bloc,
    required this.state,
  });

  LocationStableData get data => state.data;
  List<LocationEntity> get locations => data.locations;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => bloc.dispatchEvent(LocationBackEvent()),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map_outlined,
                        size: 40,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Localização',
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
              itemCount: locations.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final loc = locations[index];
                return LocationCard(location: loc);
              },
            ),
          ),
        ],
      ),
    );
  }
}

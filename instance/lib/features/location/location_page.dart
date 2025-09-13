import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';

import 'states/location_empty_state.dart';
import 'states/location_error_state.dart';
import 'states/location_loading_state.dart';
import 'states/location_stable_state.dart';

class LocationPage extends IScreenView<LocationBloc> {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context, LocationBloc bloc) {
    return Scaffold(
      body: ScreenStateBuilder(
        bloc: bloc,
        onStable: (context, state) =>
            LocationStableState(bloc: bloc, state: state),
        onLoading: (context, state) =>
            LocationLoadingState(bloc: bloc, state: state),
        onEmpty: (context, state) =>
            LocationEmptyState(bloc: bloc, state: state),
        onError: (context, state) =>
            LocationErrorState(bloc: bloc, state: state),
      ),
    );
  }
}

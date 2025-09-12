import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';

import 'states/home_empty_state.dart';
import 'states/home_error_state.dart';
import 'states/home_loading_state.dart';
import 'states/home_stable_state.dart';

class HomePage extends IScreenView<HomeBloc> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, HomeBloc bloc) {
    return Scaffold(
      body: ScreenStateBuilder(
        bloc: bloc,
        onStable: (context, state) => HomeStableState(bloc: bloc, state: state),
        onLoading: (context, state) =>
            HomeLoadingState(bloc: bloc, state: state),
        onEmpty: (context, state) => HomeEmptyState(bloc: bloc, state: state),
        onError: (context, state) => HomeErrorState(bloc: bloc, state: state),
      ),
    );
  }
}

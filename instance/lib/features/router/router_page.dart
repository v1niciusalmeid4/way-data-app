import 'package:core/app_way_data_core.dart';

import 'package:flutter/material.dart';

import 'states/router_empty_state.dart';
import 'states/router_error_state.dart';
import 'states/router_loading_state.dart';
import 'states/router_stable_state.dart';

class RouterPage extends IScreenView<RouterBloc> {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context, RouterBloc bloc) {
    return Scaffold(
      body: ScreenStateBuilder(
        bloc: bloc,
        onStable: (context, state) =>
            RouterStableState(bloc: bloc, state: state),
        onLoading: (context, state) =>
            RouterLoadingState(bloc: bloc, state: state),
        onEmpty: (context, state) => RouterEmptyState(bloc: bloc, state: state),
        onError: (context, state) => RouterErrorState(bloc: bloc, state: state),
      ),
    );
  }
}

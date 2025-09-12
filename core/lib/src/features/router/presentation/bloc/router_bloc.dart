import 'package:core/app_way_data_core.dart';

part 'router_event.dart';

class RouterBloc extends IBloC<RouterEvent, ScreenState> {
  static const String route = '/';

  RouterBloc() : super(initialState: Loading());

  // gates

  @override
  void onReady() {
    dispatchEvent(RouterReadyEvent());
    super.onReady();
  }

  @override
  void handleEvent(RouterEvent event) {
    if (event is RouterReadyEvent) {
      _handleReady(event);
    }
  }

  Future<void> _handleReady(RouterReadyEvent event) async {
    dispatchState(Loading());
  }
}

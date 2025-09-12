import 'package:core/app_way_data_core.dart';

part 'router_event.dart';

class RouterBloc extends IBloC<RouterEvent, ScreenState> {
  static const String route = '/';

  RouterBloc({required this.homeGate}) : super(initialState: Loading());

  // gates
  final HomeGate homeGate;

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

    homeGate.open(params: HomeParams(), type: GateType.offAll);
  }
}

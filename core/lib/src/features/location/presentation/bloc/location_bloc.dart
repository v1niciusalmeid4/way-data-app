import 'package:core/app_way_data_core.dart';

part 'location_event.dart';

class LocationStableData {
  final List<LocationEntity> locations;

  LocationStableData({required this.locations});
}

class LocationBloc extends IBloC<LocationEvent, ScreenState> {
  static const String route = '/location';

  late LocationParams params;

  LocationBloc({required this.findLocationByNameUseCase})
    : super(initialState: Loading());

  // usecases
  final FindLocationByNameUseCase findLocationByNameUseCase;

  @override
  void onInit() {
    params = getArguments();

    super.onInit();
  }

  @override
  void onReady() {
    dispatchEvent(LocationReadyEvent());

    super.onReady();
  }

  @override
  void handleEvent(LocationEvent event) {
    if (event is LocationReadyEvent) {
      _handleOnReady(event);
    } else if (event is LocationReloadEvent) {
      _handleReload(event);
    } else if (event is LocationBackEvent) {
      _handleBack(event);
    }
  }

  Future<void> _handleOnReady(LocationReadyEvent event) async {
    dispatchState(Loading());

    final request = await findLocationByNameUseCase(
      params: FindLocationByNameParams(name: params.name),
    );

    request.fold(
      (r) => dispatchState(Error(message: r.message)),
      (locations) => dispatchState(
        locations.isEmpty
            ? Empty()
            : Stable(data: LocationStableData(locations: locations)),
      ),
    );
  }

  Future<void> _handleReload(LocationReloadEvent event) async {
    _handleOnReady(LocationReadyEvent());
  }

  Future<void> _handleBack(LocationBackEvent event) async {
    pop();
  }
}

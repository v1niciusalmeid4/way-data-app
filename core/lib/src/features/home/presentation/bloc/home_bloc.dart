import 'package:core/app_way_data_core.dart';

part 'home_event.dart';

class HomeStableData {
  final List<CharacterEntity> Characters;

  HomeStableData({required this.Characters});
}

class HomeBloc extends IBloC<HomeEvent, ScreenState> {
  static const String route = '/';

  HomeBloc({required this.findAllCharacterUseCase})
    : super(initialState: Loading());

  // gates

  // usecases
  final FindAllCharacterUseCase findAllCharacterUseCase;

  @override
  void onReady() {
    dispatchEvent(HomeReadyEvent());
    super.onReady();
  }

  @override
  void handleEvent(HomeEvent event) {
    if (event is HomeReadyEvent) {
      _handleFetchCharacters(event);
    }
  }

  Future<void> _handleFetchCharacters(HomeReadyEvent event) async {
    final request = await findAllCharacterUseCase.call(
      params: FindAllCharacterParams(),
    );

    request.fold(
      handleFailure,
      (p) => dispatchState(Stable(data: HomeStableData(Characters: p))),
    );
  }
}

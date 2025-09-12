import 'package:core/app_way_data_core.dart';

part 'home_event.dart';

class HomeStableData {
  final List<CharacterEntity> characters;
  final bool reachMax;

  HomeStableData({required this.characters, required this.reachMax});
}

class HomeBloc extends IBloC<HomeEvent, ScreenState> {
  static const String route = '/home';

  HomeBloc({required this.findAllCharacterUseCase, required this.characterGate})
    : super(initialState: Loading());

  // gates
  final CharacterGate characterGate;

  // usecases
  final FindAllCharacterUseCase findAllCharacterUseCase;

  // state variables
  List<CharacterEntity> characters = [];

  late Pageable page;
  bool reachMax = false;

  @override
  void onInit() {
    page = Pageable();

    super.onInit();
  }

  @override
  void onReady() {
    dispatchEvent(HomeReadyEvent());

    super.onReady();
  }

  @override
  void handleEvent(HomeEvent event) {
    if (event is HomeReadyEvent) {
      _handleOnReady(event);
    } else if (event is HomeLoadMoreEvent) {
      _handleLoadMore(event);
    } else if (event is HomeOpenCharacterEvent) {
      _handleOpenCharacter(event);
    } else if (event is HomeReloadEvent) {
      _handleReload(event);
    }
  }

  Future<void> _handleOnReady(HomeReadyEvent event) async {
    page.reset();

    final request = await findAllCharacterUseCase.call(
      params: FindAllCharacterParams(
        page: page.page,
        size: page.size,
        query: event.query,
        gender: event.gender,
        status: event.status,
      ),
    );

    request.fold((r) => dispatchState(Error(message: r.message)), (characters) {
      if (characters.isEmpty) {
        dispatchState(Empty());
        return;
      }

      reachMax = characters.length < page.size;
      this.characters = characters;

      dispatchState(
        Stable(
          data: HomeStableData(characters: this.characters, reachMax: reachMax),
        ),
      );
    });
  }

  Future<void> _handleLoadMore(HomeLoadMoreEvent event) async {
    if (reachMax) return;

    page.next();

    final request = await findAllCharacterUseCase.call(
      params: FindAllCharacterParams(
        page: page.page,
        size: page.size,
        query: event.query,
        gender: event.gender,
        status: event.status,
      ),
    );

    request.fold((r) => dispatchState(Error(message: r.message)), (characters) {
      reachMax = characters.length < page.size;
      this.characters.addAll(characters);

      dispatchState(
        Stable(
          data: HomeStableData(characters: this.characters, reachMax: reachMax),
        ),
      );
    });
  }

  Future<void> _handleOpenCharacter(HomeOpenCharacterEvent event) async {
    return characterGate.open(
      params: CharacterParams(id: event.id),
      type: GateType.to,
    );
  }

  Future<void> _handleReload(HomeReloadEvent event) async {
    _handleOnReady(HomeReadyEvent());
  }
}

import 'package:core/app_way_data_core.dart';

part 'home_event.dart';

class HomeStableData {
  final List<CharacterEntity> characters;
  final bool reachMax;

  HomeStableData({required this.characters, required this.reachMax});
}

class HomeBloc extends IBloC<HomeEvent, ScreenState> {
  static const String route = '/';

  HomeBloc({required this.findAllCharacterUseCase})
    : super(initialState: Loading());

  // gates

  // usecases
  final FindAllCharacterUseCase findAllCharacterUseCase;

  //state variables
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
      _handleFetchCharacters(event);
    } else if (event is HomeLoadMoreEvent) {
      _handleLoadMore(event);
    }
  }

  Future<void> _handleFetchCharacters(HomeReadyEvent event) async {
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

    request.fold(handleFailure, (characters) {
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

    request.fold(handleFailure, (characters) {
      reachMax = characters.length < page.size;
      this.characters.addAll(characters);

      dispatchState(
        Stable(
          data: HomeStableData(characters: this.characters, reachMax: reachMax),
        ),
      );
    });
  }
}

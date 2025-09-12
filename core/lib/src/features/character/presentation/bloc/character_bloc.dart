import 'package:core/app_way_data_core.dart';

part 'character_event.dart';

class CharacterStableData {
  final CharacterEntity character;

  CharacterStableData({required this.character});
}

class CharacterBloc extends IBloC<CharacterEvent, ScreenState> {
  static const String route = '/character';

  late CharacterParams params;

  CharacterBloc({required this.findCharacterByIdUseCase})
    : super(initialState: Loading());

  // usecases
  final FindCharacterByIdUseCase findCharacterByIdUseCase;

  @override
  void onInit() {
    params = getArguments();

    super.onInit();
  }

  @override
  void onReady() {
    dispatchEvent(CharacterReadyEvent(id: params.id));

    super.onReady();
  }

  @override
  void handleEvent(CharacterEvent event) {
    if (event is CharacterReadyEvent) {
      _handleOnReady(event);
    } else if (event is CharacterReloadEvent) {
      _handleReload(event);
    } else if (event is CharacterBackHomeEvent) {
      _handleBack(event);
    }
  }

  Future<void> _handleOnReady(CharacterReadyEvent event) async {
    dispatchState(Loading());

    final request = await findCharacterByIdUseCase(
      params: FindCharacterByIdParams(id: event.id.toString()),
    );

    request.fold(
      (r) => dispatchState(Error(message: r.message)),
      (character) => dispatchState(
        Stable(data: CharacterStableData(character: character)),
      ),
    );
  }

  Future<void> _handleReload(CharacterReloadEvent event) async {
    _handleOnReady(CharacterReadyEvent(id: params.id));
  }

  Future<void> _handleBack(CharacterBackHomeEvent event) async {
    pop();
  }
}

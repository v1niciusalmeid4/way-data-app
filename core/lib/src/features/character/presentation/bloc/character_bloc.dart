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
      _handleFetchCharacters(event);
    }
  }

  Future<void> _handleFetchCharacters(CharacterReadyEvent event) async {
    final request = await findCharacterByIdUseCase(
      params: FindCharacterByIdParams(id: event.id.toString()),
    );

    request.fold(
      handleFailure,
      (character) => dispatchState(
        Stable(data: CharacterStableData(character: character)),
      ),
    );
  }
}

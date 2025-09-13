import 'package:core/app_way_data_core.dart';

class ICharacterInjector extends DependencyInjector {
  @override
  void dependencies() {
    lazyPut<CharacterBloc>(
      () =>
          CharacterBloc(findCharacterByIdUseCase: find(), locationGate: find()),
    );
  }
}

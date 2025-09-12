import 'package:core/app_way_data_core.dart';

abstract class CharacterDataSource {
  Future<List<CharacterEntity>> findAll({
    required FindAllCharacterParams params,
  });
}

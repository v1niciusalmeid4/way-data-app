import 'package:core/app_way_data_core.dart';

class CharacterDataSourceEndpoints {
  static const String base = '/character';

  static String get findAll => base;
}

class CharacterDataSourceImpl implements CharacterDataSource {
  final HttpRemote http;

  CharacterDataSourceImpl({required this.http});

  @override
  Future<List<CharacterEntity>> findAll({
    required FindAllCharacterParams params,
  }) async {
    final request = await http.request(
      CharacterDataSourceEndpoints.findAll,
      method: HttpMethod.get,
    );

    if (request.isSuccess) {
      final Characters = request.data['results'] as List;

      return Characters.map(CharacterModel.fromMap).toList();
    }

    throw RemoteException(message: request.status.message);
  }
}

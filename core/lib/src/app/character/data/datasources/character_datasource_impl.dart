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
    final endpoint = CharacterDataSourceEndpoints.findAll;

    final queryParameters = {
      'page': params.page.toString(),
      'size': params.size.toString(),
      'name': params.query,
    };

    final uri = Uri(path: endpoint, queryParameters: queryParameters);

    final request = await http.request(uri.toString(), method: HttpMethod.get);

    if (request.isSuccess) {
      final characters = request.data['results'] as List;

      return characters.map(CharacterModel.fromMap).toList();
    }

    throw RemoteException(message: request.status.message);
  }
}

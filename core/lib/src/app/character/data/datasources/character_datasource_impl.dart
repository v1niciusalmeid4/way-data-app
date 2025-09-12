import 'package:core/app_way_data_core.dart';

class CharacterDataSourceEndpoints {
  static const String base = '/character';

  static String get findAll => base;
  static String findById(String id) => '$base/$id';
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
    };

    if (params.query.isNotEmpty) {
      queryParameters['name'] = params.query;
    }

    if (params.gender != null) {
      queryParameters['gender'] = params.gender!.key;
    }

    if (params.status != null) {
      queryParameters['status'] = params.status!.key;
    }

    final uri = Uri(path: endpoint, queryParameters: queryParameters);

    final request = await http.request(uri.toString(), method: HttpMethod.get);

    if (request.isSuccess) {
      final characters = request.data['results'] as List;

      return characters.map(CharacterModel.fromMap).toList();
    }

    throw RemoteException(message: request.status.message);
  }

  @override
  Future<CharacterEntity> findById({
    required FindCharacterByIdParams params,
  }) async {
    final request = await http.request<CharacterEntity, CharacterEntity>(
      CharacterDataSourceEndpoints.findById(params.id),
      method: HttpMethod.get,
      decoder: CharacterModel.fromMap,
    );

    if (request.isSuccess) {
      return request.data!;
    }

    throw RemoteException(message: request.status.message);
  }
}

import 'package:core/app_way_data_core.dart';

class PersonDataSourceEndpoints {
  static const String base = '/character';

  static String get findAll => base;
}

class PersonDataSourceImpl implements PersonDataSource {
  final HttpRemote http;

  PersonDataSourceImpl({required this.http});

  @override
  Future<PersonEntity> findAll({required FindAllPersonParams params}) async {
    final endpoint = PersonDataSourceEndpoints.findAll;
    final uri = Uri(path: endpoint, queryParameters: {});

    final request = await http.request<PersonEntity, PersonEntity>(
      uri.toString(),
      method: HttpMethod.get,
      decoder: PersonModel.fromMap,
    );

    if (request.isSuccess) {
      return request.data!;
    }

    throw RemoteException(message: request.errorMessage);
  }
}

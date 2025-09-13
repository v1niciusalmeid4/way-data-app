import 'package:core/app_way_data_core.dart';

class LocationDataSourceEndpoints {
  static const String base = '/location';
}

class LocationDataSourceImpl implements LocationDataSource {
  final HttpRemote http;

  LocationDataSourceImpl({required this.http});

  @override
  Future<List<LocationEntity>> findByName({
    required FindLocationByNameParams params,
  }) async {
    final endpoint = LocationDataSourceEndpoints.base;

    final uri = Uri(path: endpoint, queryParameters: {'name': params.name});

    final request = await http.request(uri.toString(), method: HttpMethod.get);

    if (request.isSuccess) {
      final locations = request.data['results'] as List;

      return locations
          .map((location) => LocationModel.fromMap(location))
          .toList();
    }

    throw RemoteException(message: request.status.message);
  }
}

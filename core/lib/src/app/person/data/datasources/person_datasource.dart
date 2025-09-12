import 'package:core/app_way_data_core.dart';

abstract class PersonDataSource {
  Future<PersonEntity> findAll({required FindAllPersonParams params});
}

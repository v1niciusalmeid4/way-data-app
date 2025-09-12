abstract class BaseMapper<T> {
  T fromMap(Map<String, dynamic> map);
  T? fromMapNullable(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }
    return fromMap(map);
  }

  Map<String, dynamic> toMap(T entity);
  Map<String, dynamic>? toMapNullable(T? entity) {
    if (entity == null) {
      return null;
    }
    return toMap(entity);
  }

  List<Map<String, dynamic>> toListMap(List<T> entities) {
    return entities.map((e) => toMap(e)).toList();
  }

  List<T> listFromMap(List<dynamic> list) {
    return list.map((e) => fromMap(e)).toList();
  }
}

extension ListExt<T> on List<T> {
  bool get isMoreThanOne => length > 1;
  T? firstWhereOrNull(bool Function(T) test) {
    for (final v in this) {
      if (test(v)) {
        return v;
      }
    }
    return null;
  }
}

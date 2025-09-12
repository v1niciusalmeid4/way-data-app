class Pageable {
  int page;
  int size;

  Pageable({this.page = 0, this.size = 20});

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'size': size,
    };
  }

  void next() {
    page++;
  }

  void reset() {
    page = 0;
  }
}

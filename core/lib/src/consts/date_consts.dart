enum Month {
  janeiro('janeiro', 1),
  fevereiro('fevereiro', 2),
  marco('março', 3),
  abril('abril', 4),
  maio('maio', 5),
  junho('junho', 6),
  julho('julho', 7),
  agosto('agosto', 8),
  setembro('setembro', 9),
  outubro('outubro', 10),
  novembro('novembro', 11),
  dezembro('dezembro', 12);

  const Month(this.name, this.monthIndex);

  final String name;
  final int monthIndex;

  static Month fromDateNow() {
    return Month.values.firstWhere(
      (element) => element.monthIndex == DateTime.now().toLocal().month,
    );
  }

  static Month fromDate(DateTime date) {
    return Month.values.firstWhere(
      (element) => element.monthIndex == date.month,
    );
  }
}

enum Weekday {
  monday('segunda', 1),
  tuesday('terça', 2),
  wednesday('quarta', 3),
  thursday('quinta', 4),
  friday('sexta', 5),
  saturday('sábado', 6),
  sunday('domingo', 7);

  const Weekday(this.name, this.weekIndex);

  final String name;
  final int weekIndex;

  static Weekday fromDateNow() {
    return Weekday.values.firstWhere(
      (element) => element.weekIndex == DateTime.now().toLocal().weekday,
    );
  }

  static Weekday fromDate(DateTime date) {
    return Weekday.values.firstWhere(
      (element) => element.weekIndex == date.month,
    );
  }
}

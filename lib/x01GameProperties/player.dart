class Player {
  final bool profile;
  final String name;
  bool doublesActivated;
  int d1;
  int d2;

  int doubleSetters;

  Player(this.profile, this.name)
      : doublesActivated = false,
        d1 = -1,
        d2 = -1,
        doubleSetters = 1;

  void activateDoubles(bool value) => doublesActivated = value;

  void setDouble(int value) {
    if (doubleSetters % 2 == 1) {
      d1 = value;
      doubleSetters += 1;
    } else {
      d2 = value;
      doubleSetters += 1;
    }
  }
}

abstract class Way {
  String convertToString();
}

class JustDouble extends Way {
  final int finish;
  JustDouble({required this.finish});

  @override
  String convertToString() {
    return "D" + finish.toString();
  }
}

class DoubleDouble extends Way {
  final int prepare;
  final int finish;

  DoubleDouble({required this.prepare, required this.finish});

  @override
  String convertToString() {
    return "D" + prepare.toString() + "  " + "D" + finish.toString();
  }
}

class SingleDouble extends Way {
  final int prepare;
  final int finish;

  SingleDouble({required this.prepare, required this.finish});

  @override
  String convertToString() {
    return prepare.toString() + "  " + "D" + finish.toString();
  }
}

class SingleDoubleDouble extends Way {
  final int prepare1;
  final int prepare2;
  final int finish;

  SingleDoubleDouble(
      {required this.prepare1, required this.prepare2, required this.finish});

  @override
  String convertToString() {
    return 
       "D" +
        prepare2.toString() +
        "  " +
        prepare1.toString() +
        "  " +
        "D" +
        finish.toString();
  }
}

class SingleTripleDouble extends Way {
  final int prepare1;
  int prepare2;
  int finish;

  SingleTripleDouble(
      {required this.prepare1, required this.prepare2, required this.finish});

  @override
  String convertToString() {
    return "T" +
        prepare2.toString() +
        "  " +
        prepare1.toString() +
        "  " +
        "D" +
        finish.toString();
  }
}

class TripleDouble extends Way {
  final int prepare;
  final int finish;

  TripleDouble({required this.prepare, required this.finish});

  @override
  String convertToString() {
    return "T" + prepare.toString() + "  " + "D" + finish.toString();
  }
}

class TripleDoubleDouble extends Way {
  final int prepare1;
  final int prepare2;
  final int finish;

  TripleDoubleDouble({required this.prepare1, required this.prepare2, required this.finish});

  @override
  String convertToString() {
    return "T" +
        prepare1.toString() +
        "  " +
        "D" +
        prepare2.toString() +
        "  " +
        "D" +
        finish.toString();
  }
}

class TripleTripleDouble extends Way {
  final int prepare1;
  final int prepare2;
  final int finish;

  TripleTripleDouble({required this.prepare1, required this.prepare2, required this.finish});

  @override
  String convertToString() {
    return "T" +
        prepare1.toString() +
        "  " +
        "T" +
        prepare2.toString() +
        "  " +
        "D" +
        finish.toString();
  }
}

class TripleTripleBull extends Way {
  final int prepare1;
  final int prepare2;

  TripleTripleBull({required this.prepare1, required this.prepare2});

  @override
  String convertToString() {
    return "T" +
        prepare1.toString() +
        "  " +
        "T" +
        prepare2.toString() +
        "  " +
        "Bull";
  }
}

class Bogey extends Way {
  @override
  String convertToString() {
    return "Bogey";
  }
}

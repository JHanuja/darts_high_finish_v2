part of 'doubles_cubit.dart';

class DoublesState extends Equatable {
  final int d1;
  final int d2;

  const DoublesState({this.d1=0, this.d2=0});

  DoublesState copyWith({int? d1, int? d2}) {
    return  DoublesState(d1: d1 ?? this.d1, d2: d2 ?? this.d2);
  }

  bool bothDoublesChoosen() {
    return d1 != 0 && d2 != 0;
  }

  @override
  List<Object> get props => [d1, d2];
}

import 'package:equatable/equatable.dart';

class Throw extends Equatable {
  final int scoredPoints;
  final int dartsNeeded;

  const Throw(this.scoredPoints, this.dartsNeeded);

  @override
  List<Object?> get props => [scoredPoints,dartsNeeded];
}

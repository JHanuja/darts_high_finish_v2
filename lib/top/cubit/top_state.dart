part of 'top_cubit.dart';

class TopState extends Equatable {
  final double safeAreaHeight;
  final double width;
  final double value1;
  final double value2;
  final double value3;
  final double value4;

  const TopState(
      {this.width = 0.0,
      this.value1 = 0.0,
      this.value2 = 0.0,
      this.value3 = 0.0,
      this.value4 = 0.0,
      this.safeAreaHeight = 0.0});

  TopState copyWith(
      {double? safeAreaHeight,
      double? width,
      double? value1,
      double? value2,
      double? value3,
      double? value4}) {
    return TopState(
        safeAreaHeight: safeAreaHeight ?? this.safeAreaHeight,
        width: width ?? this.width,
        value1: value1 ?? this.value1,
        value2: value2 ?? this.value2,
        value3: value3 ?? this.value3,
        value4: value4 ?? this.value4);
  }

  @override
  List<Object> get props =>
      [safeAreaHeight, width, value1, value2, value3, value4];
}

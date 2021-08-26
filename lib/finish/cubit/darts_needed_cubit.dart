import 'package:bloc/bloc.dart';

class DartsNeededCubit extends Cubit<int> {
  DartsNeededCubit() : super(3);

  void oneDartNeeded() => emit(1);
  void twoDartsNeeded() => emit(2);
  void threeDartsNeeded() => emit(3);



}

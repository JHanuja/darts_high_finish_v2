import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(DarkTheme());

  void changeTheme() => state.isDarkTheme ? emit (LightTheme()) : emit (DarkTheme());
  
}

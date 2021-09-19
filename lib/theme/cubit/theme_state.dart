part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final bool isDarkTheme;
  final ThemeData themeData;

  const ThemeState(this.isDarkTheme, this.themeData);

  @override
  List<Object> get props => [];
}

class DarkTheme extends ThemeState {
  DarkTheme()
      : super(
          true,
          ThemeData(
            shadowColor:Color(0xffffffff), 
              hoverColor: Color(0xff403a3a),
              errorColor: Color(0xff2b2626),
              focusColor: Color(0xff0190a2),
              canvasColor: Color(0xffffffff),
              backgroundColor: Color(0xff2b2626),
              cardColor: Color(0xffffffff),
              primaryColor: Color(0xfffe6f5d),
              accentColor: Color(0xff77ffad),
              buttonColor: Color(0xffff7777),
              fontFamily: 'DoHyeon'),
        );
}

class LightTheme extends ThemeState {
  LightTheme()
      : super(
          false,
          ThemeData(
                  shadowColor:Color(0xffffffff), 
              hoverColor: Color(0xfff2f0f0),
              errorColor: Color(0xff2b2626),
              focusColor: Color(0xff77ffad),
              canvasColor: Color(0xff7798ff),
              backgroundColor: Color(0xffffffff),
              cardColor: Color(0xff2b2626),
              primaryColor: Color(0xff7798ff),
              accentColor: Color(0xff77ffad),
              buttonColor: Color(0xffff7777),
              fontFamily: 'DoHyeon'),
        );
}

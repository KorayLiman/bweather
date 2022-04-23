part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class AppTheme extends ThemeState {
  final ThemeData themeData;
  final MaterialColor materialColor;

  AppTheme({required this.themeData, required this.materialColor});
  @override
  // TODO: implement props
  List<Object> get props => [themeData, materialColor];
}

part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SwitchTheme1 extends ThemeEvent {
  final String wheatherstateshortcut;

  SwitchTheme1({required this.wheatherstateshortcut});
  @override
  // TODO: implement props
  List<Object> get props => [wheatherstateshortcut];
}

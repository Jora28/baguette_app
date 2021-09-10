part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChange extends ThemeEvent {
  final AppTheme theme;
  const ThemeChange({required this.theme});
  @override
  List<Object> get props => [theme];
}

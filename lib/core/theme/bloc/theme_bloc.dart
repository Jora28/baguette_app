import 'dart:async';

import 'package:baguette_app/core/theme/theme_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData: BaguetteThems().appThemeData[AppTheme.light]!));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChange) {
      yield ThemeState(themeData: BaguetteThems().appThemeData[event.theme]!);
    }
  }
}

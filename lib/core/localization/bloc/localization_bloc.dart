import 'dart:async';

import 'package:baguette_app/core/localization/l10n/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc()
      : super(LocalizationState(
            locale: BaguetteLocalization().localization[L10n.en]!));

  @override
  Stream<LocalizationState> mapEventToState(
    LocalizationEvent event,
  ) async* {
    if (event is ChangeLocale) {
      yield LocalizationState(
          locale: BaguetteLocalization().localization[event.l10n]!);
    }
  }
}

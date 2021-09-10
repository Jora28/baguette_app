part of 'localization_bloc.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocale extends LocalizationEvent {
  final L10n l10n;
  const ChangeLocale({required this.l10n});

  @override
  List<Object> get props => [l10n];
}

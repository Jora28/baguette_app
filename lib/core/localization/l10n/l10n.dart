import 'package:flutter/material.dart';

// class L10n {
//   static final all = [
//     const Locale('en'),
//     const Locale('ru'),
//   ];
// }

enum L10n {
  en,
  ru,
}

class BaguetteLocalization {
  static L10n currentTheme = L10n.en;
  final Map<L10n, Locale> localization = {
    L10n.ru: const Locale('ru'),
    L10n.en: const Locale('en'),
  };
}

import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Shadows {
  static List<BoxShadow> get universal => const [
        BoxShadow(
          offset: Offset(0, 1),
          color: AppColors.grey,
          blurRadius: 1,
        ),
        BoxShadow(
          offset: Offset(1, 0),
          color: AppColors.grey,
          blurRadius: 1,
        ),
        BoxShadow(
          offset: Offset(1, -1),
          color: AppColors.grey,
          blurRadius: 1,
        ),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
            color: const Color(0xff333333).withOpacity(.15),
            blurRadius: 3,
            offset: const Offset(0, 1)),
      ];
}

/// Used for all animations in the  app
class Times {
  static const Duration fastest = Duration(milliseconds: 150);
  static const Duration fast = Duration(milliseconds: 250);
  static const Duration medium = Duration(milliseconds: 500);
  static const Duration slow = Duration(milliseconds: 700);
  static const Duration slower = Duration(milliseconds: 1000);
  static const Duration slowest = Duration(milliseconds: 1500);
  static const Duration backgrounAnimationDuration = Duration(seconds: 12);
}

class Corners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 5;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);
}

class Strokes {
  static const double thin = 1;
  static const double thick = 4;
}

class Insets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get med => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class Offsets {
  static const begin = Offset(-1.0, -1.0);
  static const end = Offset.zero;
  static final tween = Tween(begin: begin, end: end);
}

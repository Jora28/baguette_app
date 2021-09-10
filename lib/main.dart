import 'package:baguette_app/core/localization/bloc/localization_bloc.dart';
import 'package:baguette_app/core/localization/l10n/l10n.dart';
import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/core/theme/bloc/theme_bloc.dart';
import 'package:baguette_app/features/categories/data/data_sourse.dart';
import 'package:baguette_app/features/categories/presentation/bloc/categorybloc_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

dynamic main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(BaguetteApp());
}

class BaguetteApp extends StatelessWidget {
  final _appRouter = FlutterRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocalizationBloc>(
          create: (BuildContext context) => LocalizationBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
        BlocProvider<CategoryblocBloc>(
          create: (BuildContext context) => CategoryblocBloc(
              getCategorySevise: GetCategorySevise(),
              getCustomerServise: GetCustomerServise()),
        )
      ],
      child: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localizationState) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                title: 'Baguette & Co.',
                theme: themeState.themeData,
                locale: localizationState.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: BaguetteLocalization().localization.values,
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}

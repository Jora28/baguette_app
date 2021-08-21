import 'package:baguette_app/core/router.gr.dart';
import 'package:baguette_app/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
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
  // This widget is the root of your application.
  final _appRouter = FlutterRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Baguette & Co.',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

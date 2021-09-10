import 'package:baguette_app/core/localization/bloc/localization_bloc.dart';
import 'package:baguette_app/core/localization/l10n/l10n.dart';
import 'package:baguette_app/core/theme/bloc/theme_bloc.dart';
import 'package:baguette_app/core/theme/theme_data.dart';
import 'package:baguette_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? dropdownvalue = "English";

  late ThemeBloc themeBloc;
  late LocalizationBloc localizationBloc;
  late AppLocalizations locale;

  List<String> list = [
    "Русский",
    "English",
  ];
  @override
  void didChangeDependencies() {
    themeBloc = BlocProvider.of<ThemeBloc>(context);
    localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    locale = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.settings),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _listBuild(list.length, list),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        locale.mode,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    IconButton(
                      onPressed: BaguetteThems.currentTheme == AppTheme.light
                          ? () {
                              BaguetteThems.currentTheme = AppTheme.dark;
                              themeBloc
                                  .add(const ThemeChange(theme: AppTheme.dark));
                            }
                          : () {
                              BaguetteThems.currentTheme = AppTheme.light;
                              themeBloc.add(
                                  const ThemeChange(theme: AppTheme.light));
                            },
                      icon: BaguetteThems.currentTheme == AppTheme.dark
                          ? const Icon(
                              Icons.dark_mode,
                            )
                          : const Icon(
                              Icons.light_mode,
                            ),
                    ),
                  ],
                ),
              ),
              dropDouwnLanguages(),
            ],
          ),
        );
      },
    );
  }

  Widget dropDouwnLanguages() => DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          errorStyle: const TextStyle(color: Colors.white),
          labelText: dropdownvalue,
          labelStyle: const TextStyle(color: AppColors.blue),
        ),
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.black),
        value: dropdownvalue,
        onChanged: BaguetteLocalization.currentTheme == L10n.ru
            ? (String? value) {
                BaguetteLocalization.currentTheme = L10n.en;
                localizationBloc.add(const ChangeLocale(l10n: L10n.en));
                setState(() {
                  dropdownvalue = value;
                });
              }
            : (String? value) {
                BaguetteLocalization.currentTheme = L10n.ru;
                localizationBloc.add(const ChangeLocale(l10n: L10n.ru));
                setState(() {
                  dropdownvalue = value;
                });
              },
        items: list.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
}

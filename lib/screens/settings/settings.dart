import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/settings/language_dropdown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsBody extends StatefulWidget {
  static const String routeName = 'settings';
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.0),
            child: Text(
              appLocal.language,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const LanguageDropDown(),
        ],
      ),
    );
  }
}

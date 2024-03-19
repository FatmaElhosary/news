import 'package:flutter/material.dart';
import 'package:news/providers/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final appLocal = AppLocalizations.of(context)!;
    return DropdownMenu(
        initialSelection: languageProvider.langCode,
        expandedInsets: const EdgeInsets.all(8),
        onSelected: (value) {
          if (value != null) {
            languageProvider.changeLanguage(value);
          }
        },
        dropdownMenuEntries: [
          DropdownMenuEntry(value: 'en', label: appLocal.english),
          DropdownMenuEntry(value: 'ar', label: appLocal.arabic)
        ]);
  }
}

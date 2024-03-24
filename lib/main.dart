import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/providers/language_provider.dart';
import 'package:news/screens/home_screen/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => LanguageProvider(),
      child: const NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Provider.of<LanguageProvider>(context).langCode),
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.light,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

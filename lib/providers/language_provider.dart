import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider with ChangeNotifier {
  String langCode = 'en';
  LanguageProvider() {
    getLanguageFromShared();
  }

  void changeLanguage(String code) {
    if (code == langCode) return;
    langCode = code;
    setLanguageToShared();
    notifyListeners();
  }

  void setLanguageToShared() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an langCode value to 'langCode' key.
    await prefs.setString('langCode', langCode);
  }

  void getLanguageFromShared() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an langCode value to 'langCode' key.
    String lang = prefs.getString('langCode') ?? 'en';
    langCode = lang;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

enum LanguageType { english }

const String english = 'en';
const String assetsPathLocalisations = 'assets/translations';
const Locale englishLocal = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
    }
  }
}

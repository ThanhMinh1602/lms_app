import 'package:flutter/material.dart';
import 'package:lms_app/l10n/app_localizations.dart';

extension L10nExtension on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw StateError(
        'AppLocalizations not found. Check localizationsDelegates and supportedLocales in MaterialApp.',
      );
    }
    return localizations;
  }
}

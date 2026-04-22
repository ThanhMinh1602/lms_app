import 'package:flutter/material.dart';
import 'package:lms_app/l10n/app_localizations.dart';
extension L10nExtension on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw Exception('AppLocalizations not found in context. Did you forget to add localizationsDelegates in MaterialApp?');
    }
    return localizations;
  }
}
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Learning Management System';

  @override
  String get homeTitle => 'Admin Dashboard';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get loginButton => 'Login';
}

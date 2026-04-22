// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Hệ thống Quản lý Học tập';

  @override
  String get homeTitle => 'Trang chủ Admin';

  @override
  String welcomeUser(String name) {
    return 'Chào mừng, $name!';
  }

  @override
  String get loginButton => 'Đăng nhập';
}

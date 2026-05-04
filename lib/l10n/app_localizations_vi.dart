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
  String get appName => 'LMS EdTech';

  @override
  String get splashSlogan => 'Học tập không giới hạn\nMọi lúc, mọi nơi';

  @override
  String get signInTitle => 'Đăng nhập';

  @override
  String get signUpTitle => 'Đăng ký';

  @override
  String get forgotPasswordPlainTitle => 'Quên mật khẩu?';

  @override
  String get forgotPasswordPlainSubtitle =>
      'Nhập email của bạn để nhận hướng dẫn khôi phục mật khẩu.';

  @override
  String get resetPasswordSubtitle =>
      'Tạo mật khẩu mới để tiếp tục sử dụng tài khoản của bạn.';

  @override
  String get nameLabel => 'Họ và tên';

  @override
  String get namePlaceholder => 'Tên của bạn';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailPlaceholder => 'study@email.com';

  @override
  String get passwordLabel => 'Mật khẩu';

  @override
  String get passwordPlaceholder => 'Mật khẩu của bạn';

  @override
  String get newPasswordLabel => 'Mật khẩu mới';

  @override
  String get confirmPasswordLabel => 'Xác nhận mật khẩu';

  @override
  String get phoneNumberLabel => 'Số điện thoại';

  @override
  String get phoneNumberPlaceholder => '0334 xxxx xxxx';

  @override
  String get resetPasswordButton => 'Đặt lại mật khẩu';

  @override
  String get createPasswordButton => 'Tạo mật khẩu';

  @override
  String get termsAgreePrefix => 'Tôi đồng ý với ';

  @override
  String get termsAndConditions => 'điều khoản và điều kiện';

  @override
  String get termsAgreeSuffix =>
      ' và chính sách bảo vệ dữ liệu cá nhân của ứng dụng';

  @override
  String get googleLoginLabel => 'Đăng nhập với Google';

  @override
  String get facebookLoginLabel => 'Đăng nhập với Facebook';

  @override
  String get appleLoginLabel => 'Đăng nhập với Apple';
}

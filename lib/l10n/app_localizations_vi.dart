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
  String get loginTitle => 'Chào mừng trở lại! 👋';

  @override
  String get loginSubtitle =>
      'Hãy đăng nhập để tiếp tục hành trình khám phá tri thức của bạn.';

  @override
  String get registerTitle => 'Tạo tài khoản mới 🚀';

  @override
  String get registerSubtitle =>
      'Tham gia cộng đồng học tập và phát triển bản thân ngay hôm nay.';

  @override
  String get forgotPasswordTitle => 'Quên mật khẩu? 🔐';

  @override
  String get forgotPasswordSubtitle =>
      'Nhập email của bạn, chúng tôi sẽ gửi mã khôi phục trong giây lát.';

  @override
  String get loginButton => 'Đăng nhập';

  @override
  String get registerButton => 'Đăng ký';

  @override
  String get sendResetCodeButton => 'Gửi mã khôi phục';

  @override
  String get emailHint => 'Email của bạn';

  @override
  String get passwordHint => 'Mật khẩu';

  @override
  String get fullNameHint => 'Họ và tên';

  @override
  String get confirmPasswordHint => 'Xác nhận mật khẩu';

  @override
  String get enterEmailHint => 'Nhập email liên kết';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get dontHaveAccount => 'Chưa có tài khoản? ';

  @override
  String get alreadyHaveAccount => 'Đã có tài khoản? ';

  @override
  String get registerNow => 'Đăng ký ngay';

  @override
  String get loginNow => 'Đăng nhập ngay';

  @override
  String get backToLogin => 'Quay lại Đăng nhập';
}

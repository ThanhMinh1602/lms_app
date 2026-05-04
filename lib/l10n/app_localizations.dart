import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In vi, this message translates to:
  /// **'Hệ thống Quản lý Học tập'**
  String get appTitle;

  /// No description provided for @appName.
  ///
  /// In vi, this message translates to:
  /// **'LMS EdTech'**
  String get appName;

  /// No description provided for @splashSlogan.
  ///
  /// In vi, this message translates to:
  /// **'Học tập không giới hạn\nMọi lúc, mọi nơi'**
  String get splashSlogan;

  /// No description provided for @signInTitle.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập'**
  String get signInTitle;

  /// No description provided for @signUpTitle.
  ///
  /// In vi, this message translates to:
  /// **'Đăng ký'**
  String get signUpTitle;

  /// No description provided for @forgotPasswordPlainTitle.
  ///
  /// In vi, this message translates to:
  /// **'Quên mật khẩu?'**
  String get forgotPasswordPlainTitle;

  /// No description provided for @forgotPasswordPlainSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Nhập email của bạn để nhận hướng dẫn khôi phục mật khẩu.'**
  String get forgotPasswordPlainSubtitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In vi, this message translates to:
  /// **'Tạo mật khẩu mới để tiếp tục sử dụng tài khoản của bạn.'**
  String get resetPasswordSubtitle;

  /// No description provided for @nameLabel.
  ///
  /// In vi, this message translates to:
  /// **'Họ và tên'**
  String get nameLabel;

  /// No description provided for @namePlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Tên của bạn'**
  String get namePlaceholder;

  /// No description provided for @emailLabel.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'study@email.com'**
  String get emailPlaceholder;

  /// No description provided for @passwordLabel.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu'**
  String get passwordLabel;

  /// No description provided for @passwordPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu của bạn'**
  String get passwordPlaceholder;

  /// No description provided for @newPasswordLabel.
  ///
  /// In vi, this message translates to:
  /// **'Mật khẩu mới'**
  String get newPasswordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In vi, this message translates to:
  /// **'Xác nhận mật khẩu'**
  String get confirmPasswordLabel;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In vi, this message translates to:
  /// **'Số điện thoại'**
  String get phoneNumberLabel;

  /// No description provided for @phoneNumberPlaceholder.
  ///
  /// In vi, this message translates to:
  /// **'0334 xxxx xxxx'**
  String get phoneNumberPlaceholder;

  /// No description provided for @resetPasswordButton.
  ///
  /// In vi, this message translates to:
  /// **'Đặt lại mật khẩu'**
  String get resetPasswordButton;

  /// No description provided for @createPasswordButton.
  ///
  /// In vi, this message translates to:
  /// **'Tạo mật khẩu'**
  String get createPasswordButton;

  /// No description provided for @termsAgreePrefix.
  ///
  /// In vi, this message translates to:
  /// **'Tôi đồng ý với '**
  String get termsAgreePrefix;

  /// No description provided for @termsAndConditions.
  ///
  /// In vi, this message translates to:
  /// **'điều khoản và điều kiện'**
  String get termsAndConditions;

  /// No description provided for @termsAgreeSuffix.
  ///
  /// In vi, this message translates to:
  /// **' và chính sách bảo vệ dữ liệu cá nhân của ứng dụng'**
  String get termsAgreeSuffix;

  /// No description provided for @googleLoginLabel.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập với Google'**
  String get googleLoginLabel;

  /// No description provided for @facebookLoginLabel.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập với Facebook'**
  String get facebookLoginLabel;

  /// No description provided for @appleLoginLabel.
  ///
  /// In vi, this message translates to:
  /// **'Đăng nhập với Apple'**
  String get appleLoginLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

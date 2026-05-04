import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/core/theme/app_theme.dart'; // IMPORT AppTheme ở đây
import 'package:lms_app/l10n/app_localizations.dart';
import 'package:lms_app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) => context.l10n.appTitle,
          routerConfig: AppPages.router,

          // 1. Đăng ký Light Theme (Đã chứa AppColorsExtension)
          theme: AppTheme.lightTheme,

          // 2. Đăng ký Dark Theme (Để khi switch mode không bị crash)
          darkTheme: AppTheme.darkTheme,

          // 3. Chế độ Theme (System sẽ tự động đổi theo máy, hoặc chọn Light/Dark)
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
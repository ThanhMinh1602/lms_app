import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 1. IMPORT THƯ VIỆN Ở ĐÂY
import 'package:lms_app/core/extensions/l10n_extension.dart';
import 'package:lms_app/l10n/app_localizations.dart';
import 'package:lms_app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. BỌC SCREEN UTIL INIT Ở NGOÀI CÙNG
    return ScreenUtilInit(
      // Kích thước chuẩn trên Figma (Thay đổi nếu design của bạn có kích thước khác)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {

        // Trả về MaterialApp.router cũ của bạn ở bên trong builder
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate, // Delegate từ file tự sinh
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // Danh sách các ngôn ngữ hỗ trợ
          supportedLocales: AppLocalizations.supportedLocales,

          // Sử dụng appTitle từ file dịch
          onGenerateTitle: (context) => context.l10n.appTitle,

          routerConfig: AppPages.router,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0EA5E9)),
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
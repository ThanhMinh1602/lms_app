import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lms_app/l10n/app_localizations.dart';
import 'package:lms_app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Delegate từ file tự sinh
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // 2. Danh sách các ngôn ngữ hỗ trợ
      supportedLocales: AppLocalizations.supportedLocales,

      // 3. Sử dụng appTitle từ file dịch
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,

      routerConfig: AppPages.router,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0EA5E9)), // bg-sky-50 tone
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
    );
  }
}
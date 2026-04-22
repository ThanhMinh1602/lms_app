import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/features/splash/pages/splash_page.dart';

import 'app_routes.dart';
class AppPages {
  AppPages._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
    ],

    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Trang không tồn tại (404)')),
    ),
  );
}
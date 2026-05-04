import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/features/auth/forgot_password/page/forgot_password_page.dart';
import 'package:lms_app/features/auth/login/page/login_page.dart';
import 'package:lms_app/features/auth/register/page/register_page.dart';
import 'package:lms_app/features/auth/reset_password/page/reset_password_page.dart';
import 'package:lms_app/features/main/main_page.dart';
import 'package:lms_app/features/splash/page/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash.path,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register.path,
        name: AppRoutes.register.name,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword.path,
        name: AppRoutes.forgotPassword.name,
        builder: (context, state) => const ForgotPasswordPage(),
      ),GoRoute(
        path: AppRoutes.resetPassword.path,
        name: AppRoutes.resetPassword.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ResetPasswordPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPage(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home.path,
                name: AppRoutes.home.name,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Giao diện Trang Chủ')),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.schedule.path,
                name: AppRoutes.schedule.name,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Giao diện Lịch Học')),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.chat.path,
                name: AppRoutes.chat.name,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Giao diện Tin Nhắn')),
                ),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile.path,
                name: AppRoutes.profile.name,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Giao diện Cá Nhân')),
                ),
              ),
            ],
          ),
        ],
      ),


    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Trang không tồn tại (404)'))),
  );
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
class AppPages {
  AppPages._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home.path,
    debugLogDiagnostics: true,
    routes: [
      // GoRoute(
      //   path: AppRoute.home.path,
      //   name: AppRoute.home.name, // Lấy name từ enum
      //   builder: (context, state) => const HomePage(),
      // ),
      // GoRoute(
      //   path: AppRoute.login.path,
      //   name: AppRoute.login.name,
      //   builder: (context, state) => const LoginPage(),
      // ),
      // GoRoute(
      //   path: AppRoute.studentDetail.path,
      //   name: AppRoute.studentDetail.name,
      //   builder: (context, state) {
      //     final id = state.pathParameters['id']!;
      //     return StudentDetailPage(studentId: id);
      //   },
      // ),
    ],

    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Trang không tồn tại (404)')),
    ),
  );
}
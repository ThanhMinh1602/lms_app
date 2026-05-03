enum AppRoutes {
  splash(path: '/', name: 'splash'),
  login(path: '/login', name: 'login'),
  register(path: '/register', name: 'register'),
  forgotPassword(path: '/forgot-password', name: 'forgot_password'),
  home(path: '/home', name: 'home'),
  schedule(path: '/schedule', name: 'schedule'),
  chat(path: '/chat', name: 'chat'),
  profile(path: '/profile', name: 'profile'),

  studentDetail(path: '/student/:id', name: 'student_detail');

  final String path;
  final String name;
  const AppRoutes({required this.path, required this.name});
}
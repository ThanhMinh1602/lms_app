enum AppRoutes {
  splash(path: '/', name: 'splash'),
  home(path: '/home', name: 'home'),
  login(path: '/login', name: 'login'),
  studentDetail(path: '/student/:id', name: 'student_detail');

  final String path;
  final String name;
  const AppRoutes({required this.path, required this.name});
}
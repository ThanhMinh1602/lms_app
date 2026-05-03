import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/my_app/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Ép App chạy chế độ tràn viền (Edge-to-edge)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // 3. Đặt màu trong suốt cho cả Status Bar (trên) và Navigation Bar (dưới)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Trong suốt thanh pin, sóng
      systemNavigationBarColor: Colors.transparent, // Trong suốt thanh vuốt ở đáy
      systemNavigationBarDividerColor: Colors.transparent,

      // Tùy chọn: Icon trên thanh trạng thái màu Đen (dark) hay Trắng (light)
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

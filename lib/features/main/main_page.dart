import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms_app/core/extensions/context_extension.dart';

class MainPage extends StatelessWidget {
  // Biến này do GoRouter tự động truyền vào để quản lý trạng thái các Tab
  final StatefulNavigationShell navigationShell;

  const MainPage({super.key, required this.navigationShell});

  // Hàm xử lý khi người dùng bấm vào Tab ở dưới đáy
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // Tính năng xịn: Nếu đang ở Tab Trang chủ, bấm thêm phát nữa vào icon Trang chủ -> Tự động cuộn lên đầu / Reset về màn hình gốc của Tab đó
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body bây giờ chính là navigationShell (Nó sẽ tự động tráo đổi các màn hình Home, Schedule, Profile)
      body: navigationShell,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: context.colors.primary, // Dùng màu lấy từ extension
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            label: 'Lịch học',
          ),
          // --- THÊM TAB CHAT VÀO ĐÂY ---
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Tin nhắn',
          ),
          // ----------------------------
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
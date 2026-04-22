class AppDimens {
  AppDimens._();

  // --- Hệ thống lưới chuẩn Material (Baseline Grid) ---
  // Mọi khoảng cách (padding/margin) nên là bội số của 4 hoặc 8.
  static const double grid0_5 = 4.0;
  static const double grid1 = 8.0;
  static const double grid1_5 = 12.0;
  static const double grid2 = 16.0; // Khoảng cách chuẩn nhất trong Material
  static const double grid3 = 24.0; // Thường dùng cho padding màn hình hoặc khoảng cách lớn
  static const double grid4 = 32.0;
  static const double grid5 = 40.0;
  static const double grid6 = 48.0;

  // --- Bố cục màn hình (Layout) ---
  static const double screenMargin = 16.0; // Căn lề 2 bên trái/phải cho Mobile
  static const double screenMarginTablet = 24.0; // Căn lề cho màn hình lớn hơn

  // --- Material 3 Shape Scale (Hệ thống bo góc) ---
  // Google M3 quy định các mức độ bo góc rất cụ thể cho từng Component
  static const double shapeExtraSmall = 4.0;  // Dùng cho: Checkbox, Tooltip, SnackBar
  static const double shapeSmall = 8.0;       // Dùng cho: Chip, TextField (Outlined)
  static const double shapeMedium = 12.0;     // Dùng cho: Card (Flashcard của bạn)
  static const double shapeLarge = 16.0;      // Dùng cho: Bottom Sheet, Drawer, Dialog nhỏ
  static const double shapeExtraLarge = 28.0; // Dùng cho: FAB (Nút nổi), Dialog lớn
  static const double shapeFull = 999.0;      // Dùng cho: Nút tròn, Avatar, Badge

  // --- Material Icon Sizes ---
  static const double iconSmall = 20.0;
  static const double iconMedium = 24.0;      // Chuẩn icon hệ thống (System Icon)
  static const double iconLarge = 32.0;
  static const double iconExtraLarge = 48.0;

  // --- Trải nghiệm người dùng (Accessibility & Component Heights) ---
  /// Material Design yêu cầu vùng chạm (Touch Target) tối thiểu phải là 48x48
  /// để ngón tay người dùng không bấm trượt.
  static const double minTouchTarget = 48.0;

  /// Chiều cao nút bấm (Button) chuẩn của Material 3
  static const double buttonHeight = 40.0;    // Lưu ý: Nút cao 40 nhưng vùng chạm (margin/padding) vẫn nên bù đủ 48

  /// Nút thao tác nổi (Floating Action Button)
  static const double fabSize = 56.0;
  static const double fabSizeLarge = 96.0;

  // --- Thanh điều hướng (Navigation) chuẩn M3 ---
  /// AppBar chuẩn M3 cao 64 (M2 là 56)
  static const double topAppBarHeight = 64.0;

  /// Bottom Navigation chuẩn M3 cao 80 (M2 là 56)
  static const double bottomNavHeight = 80.0;

  // --- Thông số cho App Học Tập của bạn ---
  static const double flashcardMinHeight = 240.0; // Vẫn giữ bội số của 8 (30 * 8)
  static const double cardElevation = 1.0; // M3 chuộng elevation rất thấp (chủ yếu dùng đổ bóng mờ hoặc đổi màu nền)
}
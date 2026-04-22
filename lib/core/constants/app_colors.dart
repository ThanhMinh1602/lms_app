import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  // --- Nền & Bề mặt (Background & Surface) ---
  /// Màu nền chủ đạo của App (Tương đương Tailwind bg-sky-50)
  static const Color background = Color(0xFFF0F9FF);

  /// Màu nền cho các thẻ (Flashcard, Bài học), BottomSheet, Dialog
  static const Color surface = Color(0xFFFFFFFF);

  // --- Màu chủ đạo & Màu nhấn (Primary & Secondary) ---
  /// Xanh dương đậm (Dùng cho AppBar, Button chính, Thanh tiến độ) - sky-500
  static const Color primary = Color(0xFF0EA5E9);

  /// Cam vàng (Dùng cho Icon nổi bật, Nút "Bắt đầu Quiz", Highlight từ vựng) - amber-500
  static const Color secondary = Color(0xFFF59E0B);

  // --- Màu chữ (Typography) ---
  /// Chữ chính (Tiêu đề, nội dung học liệu) - slate-900 (Đọc rõ trên nền sáng)
  static const Color textPrimary = Color(0xFF0F172A);

  /// Chữ phụ (Mô tả, ghi chú, thời gian) - slate-500
  static const Color textSecondary = Color(0xFF64748B);

  // --- Màu trạng thái (Semantic / Quiz States) ---
  /// Trả lời đúng, Hoàn thành bài học - emerald-500
  static const Color success = Color(0xFF10B981);

  /// Trả lời sai, Cảnh báo lỗi - red-500
  static const Color error = Color(0xFFEF4444);

  /// Nhắc nhở, Chuỗi ngày học liên tục (Streak) - amber-500
  static const Color warning = Color(0xFFF59E0B);

  /// Thông tin thêm, Tooltip - blue-500
  static const Color info = Color(0xFF3B82F6);

  // --- Viền & Đường phân cách (Border & Divider) ---
  /// Viền mờ cho Flashcard chưa lật, Divider giữa các câu hỏi - slate-200
  static const Color border = Color(0xFFE2E8F0);
}
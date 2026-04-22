import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  const CustomImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Kiểm tra xem đây là link mạng (API) hay file có sẵn trong app (assets)
    final isNetwork = imagePath.startsWith('http://') || imagePath.startsWith('https://');

    // 2. Kiểm tra định dạng có phải là vector (SVG) không
    final isSvg = imagePath.toLowerCase().endsWith('.svg');

    if (isNetwork) {
      if (isSvg) {
        return SvgPicture.network(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      }
      return CachedNetworkImage(
        imageUrl: imagePath,
        width: width,
        height: height,
        fit: fit,
        color: color,
        // Hiển thị vòng xoay mờ khi đang tải ảnh từ mạng
        placeholder: (context, url) => SizedBox(
          width: width ?? 24,
          height: height ?? 24,
          child: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
        // Icon báo lỗi nếu link ảnh bị chết
        errorWidget: (context, url, error) => Icon(Icons.broken_image, color: Colors.grey.shade400),
      );
    } else {
      if (isSvg) {
        return SvgPicture.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      }
      return Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
        color: color,
      );
    }
  }
}
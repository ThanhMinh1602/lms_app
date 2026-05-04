import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms_app/core/constants/app_dimens.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String? semanticLabel;
  final Clip clipBehavior;

  const CustomImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.semanticLabel,
    this.clipBehavior = Clip.antiAlias,
  });

  bool get _isNetwork =>
      imagePath.startsWith('http://') || imagePath.startsWith('https://');

  bool get _isSvg => imagePath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (_isNetwork) {
      image = _isSvg ? _networkSvg() : _networkRaster();
    } else {
      image = _isSvg ? _assetSvg() : _assetRaster();
    }

    if (borderRadius == null) return image;

    return ClipRRect(
      borderRadius: borderRadius!,
      clipBehavior: clipBehavior,
      child: image,
    );
  }

  Widget _networkSvg() {
    return SvgPicture.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      semanticsLabel: semanticLabel,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
      placeholderBuilder: (_) => placeholder ?? _defaultPlaceholder(),
    );
  }

  Widget _networkRaster() {
    return CachedNetworkImage(
      imageUrl: imagePath,
      width: width,
      height: height,
      fit: fit,
      color: color,
      placeholder: (_, __) => placeholder ?? _defaultPlaceholder(),
      errorWidget: (_, __, ___) => errorWidget ?? _defaultErrorWidget(),
    );
  }

  Widget _assetSvg() {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      semanticsLabel: semanticLabel,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
      placeholderBuilder: (_) => placeholder ?? _defaultPlaceholder(),
    );
  }

  Widget _assetRaster() {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      color: color,
      semanticLabel: semanticLabel,
      errorBuilder: (_, __, ___) => errorWidget ?? _defaultErrorWidget(),
    );
  }

  Widget _defaultPlaceholder() {
    return SizedBox(
      width: width ?? AppDimens.iconMedium,
      height: height ?? AppDimens.iconMedium,
      child: const Padding(
        padding: EdgeInsets.all(4),
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _defaultErrorWidget() {
    return SizedBox(
      width: width ?? AppDimens.iconMedium,
      height: height ?? AppDimens.iconMedium,
      child: Icon(
        Icons.broken_image_outlined,
        size: AppDimens.iconMedium,
        color: Colors.grey.shade400,
      ),
    );
  }
}

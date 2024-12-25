import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  const Picture({
    required this.source,
    this.borderRadius,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.cache = true,
    super.key,
  });

  final String source;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final bool cache;

  @override
  Widget build(BuildContext context) {
    if (_isValidUrl(source)) {
      return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: source,
          width: width,
          height: height,
          fit: fit,
        ),
      );
    }
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.asset(
        source,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }

  bool _isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && uri.hasAuthority;
    } catch (_) {
      return false;
    }
  }
}

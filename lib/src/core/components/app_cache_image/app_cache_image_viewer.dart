import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:introvertdiaries/src/core/enum/enum.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class AppCacheImageViewer extends CachedNetworkImage {
  AppCacheImageViewer({
    required super.imageUrl, required this.imageTypeEnum, super.key,
    BoxFit super.fit = BoxFit.cover,
  });
  final ImageTypeEnum imageTypeEnum;

  @override
  Widget build(BuildContext context) {
    switch (imageTypeEnum) {
      case ImageTypeEnum.assets:
        return Image.asset(imageUrl, fit: fit);
      case ImageTypeEnum.svg:
        return SvgPicture.asset(imageUrl);

      case ImageTypeEnum.file:
        return Image.file(File(imageUrl), fit: fit);

      case ImageTypeEnum.network:
        return CachedNetworkImage(
          fit: fit,
          imageUrl: imageUrl,
          // errorWidget: (context, url, error) {
          //   return SvgPicture.asset(
          //     Assets.svg.appLogo.path,
          //   );
          // },
        );
    }
  }
}

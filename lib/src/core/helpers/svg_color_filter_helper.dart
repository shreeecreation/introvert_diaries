import 'package:flutter/material.dart';

class SvgColorFilterHelper {
  ColorFilter colorFilterSrc(Color colors) {
    return ColorFilter.mode(colors, BlendMode.srcIn);
  }
}

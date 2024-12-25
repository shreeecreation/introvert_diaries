import 'package:introvertdiaries/src/core/components/adaptive_sizer/adaptive_helper.dart';
import 'package:flutter/material.dart';

class AdaptiveSizer extends StatelessWidget {
  const AdaptiveSizer({
    required this.builder, super.key,
    this.designSize = AdaptiveHelper.defaultSize,
  });

  final Widget Function(BuildContext) builder;
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        AdaptiveHelper.init(constraints: constraints, designSize: designSize);
        return builder(context);
      },
    );
  }
}

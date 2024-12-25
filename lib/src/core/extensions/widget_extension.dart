import 'package:introvertdiaries/src/core/core.dart';

extension WidgetExtensionX on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(
        child: this,
      );

  SliverPadding sliverPadding(EdgeInsets insets) => SliverPadding(
        padding: insets,
        sliver: toSliverBox,
      );

  Padding pad(double pad) => Padding(
        padding: EdgeInsets.all(pad.r),
        child: this,
      );

  Padding px(double pad) => Padding(
        padding: EdgeInsets.symmetric(horizontal: pad.w),
        child: this,
      );

  Padding pxy(double padX, double padY) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padX, vertical: padY),
        child: this,
      );

  Padding py(double pad) => Padding(
        padding: EdgeInsets.symmetric(vertical: pad.h),
        child: this,
      );

  Padding pOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) =>
      Padding(
        padding: EdgeInsets.only(
          left: left.w,
          top: top.h,
          right: right.w,
          bottom: bottom.h,
        ),
        child: this,
      );

  Expanded expanded({int flex = 1}) => Expanded(
        flex: flex,
        child: this,
      );
}

extension type DurationFormatter(Duration duration) {
  String minuteSecondFormatted() {
    toString();
    return [duration.inMinutes.remainder(60), duration.inSeconds.remainder(60)]
        .map((seg) {
      return seg.toString().padLeft(2, '0');
    }).join(':');
  }
}

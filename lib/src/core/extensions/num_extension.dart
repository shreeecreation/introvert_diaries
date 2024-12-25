import 'package:introvertdiaries/src/core/core.dart';

extension NumExtensionX on num {
  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get seconds => Duration(seconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get days => Duration(days: toInt());

  Future<int> get delayedMicroSeconds async => Future.delayed(toInt().microseconds);

  Future<int> get delayedMilliSeconds async => Future.delayed(toInt().milliseconds);

  Future<int> get delayedSeconds async => Future.delayed(toInt().seconds);

  Future<int> get delayedMinutes async => Future.delayed(toInt().minutes);

  Future<int> get delayedHours async => Future.delayed(toInt().hours);

  Radius get circular => Radius.circular(toDouble().r);

  BorderRadiusGeometry get rounded => BorderRadius.circular(toDouble().r);

  EdgeInsets get all => EdgeInsets.all(toDouble().r);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble().w);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble().h);

  String toOrdinal() {
    const ordinalWords = [
      'First',
      'Second',
      'Third',
      'Fourth',
      'Fifth',
      'Sixth',
      'Seventh',
      'Eighth',
      'Ninth',
      'Tenth',
      'Eleventh',
      'Twelfth',
      'Thirteenth',
      'Fourteenth',
      'Fifteenth',
      'Sixteenth',
      'Seventeenth',
      'Eighteenth',
      'Nineteenth',
      'Twentieth',
      'Twenty-first',
      'Twenty-second',
      'Twenty-third',
      'Twenty-fourth',
      'Twenty-fifth',
      'Twenty-sixth',
      'Twenty-seventh',
      'Twenty-eighth',
      'Twenty-ninth',
      'Thirtieth',
      'Thirty-first',
      'Thirty-second',
      'Thirty-third',
      'Thirty-fourth',
      'Thirty-fifth',
      'Thirty-sixth',
      'Thirty-seventh',
      'Thirty-eighth',
      'Thirty-ninth',
      'Fortieth',
      'Forty-first',
      'Forty-second',
      'Forty-third',
      'Forty-fourth',
      'Forty-fifth',
      'Forty-sixth',
      'Forty-seventh',
      'Forty-eighth',
      'Forty-ninth',
      'Fiftieth',
      'Fifty-first',
      'Fifty-second',
      'Fifty-third',
      'Fifty-fourth',
      'Fifty-fifth',
      'Fifty-sixth',
      'Fifty-seventh',
      'Fifty-eighth',
      'Fifty-ninth',
      'Sixtieth',
      'Sixty-first',
      'Sixty-second',
      'Sixty-third',
      'Sixty-fourth',
      'Sixty-fifth',
      'Sixty-sixth',
      'Sixty-seventh',
      'Sixty-eighth',
      'Sixty-ninth',
    ];

    if (this < 1 || this > 69) throw ArgumentError('Number must be between 1 and 69.');
    return ordinalWords[toInt() - 1];
  }
}

extension ResponsiveSizeExt on num {
  double get w => AdaptiveHelper().setWidth(this);

  double get h => AdaptiveHelper().setHeight(this);

  double get r => AdaptiveHelper().radius(this);

  double get pw => AdaptiveHelper().width * this;

  double get ph => AdaptiveHelper().height * this;

  double get sp => AdaptiveHelper().setSp(this);

  Widget get verticalSpace => AdaptiveHelper().setVerticalSpacing(this);

  Widget get verticalSpaceRadius => AdaptiveHelper().setVerticalSpacingRadius(this);

  Widget get horizontalSpace => AdaptiveHelper().setHorizontalSpacing(this);

  Widget get horizontalSpaceRadius => AdaptiveHelper().setHorizontalSpacingRadius(this);
}

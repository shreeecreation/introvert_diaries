import 'package:introvertdiaries/src/core/core.dart';

class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({
    required this.title,
    required this.subTitle,
    required this.titleStyle,
    required this.subtitleStyle,
    super.key,
    this.gap = 10.0,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final String subTitle;
  final double gap;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Text(title, style: titleStyle, textAlign: textAlign),
        6.verticalSpace,
        Text(
          subTitle,
          style: subtitleStyle.copyWith(letterSpacing: -0.4),
          textAlign: textAlign,
        ),
      ],
    );
  }
}

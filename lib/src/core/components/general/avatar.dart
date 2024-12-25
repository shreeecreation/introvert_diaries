import 'package:introvertdiaries/src/core/components/general/picture.dart';
import 'package:introvertdiaries/src/core/core.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    this.avatarText = '-',
    this.source,
    this.fallbackSource,
    this.showFullScreen = true,
    this.size = 24,
    this.border,
    super.key,
  });

  final String avatarText;
  final bool showFullScreen;
  final double size;
  final String? source;
  final String? fallbackSource;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    if (source == null) return _Placeholder(avatarText, Size(size, size));

    return DecoratedBox(
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Picture(
          source: source ?? '',
          height: size,
          width: size,
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder(this.avatarText, this.size);

  final String avatarText;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: AppColors.primaryColor,
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            AvatarUtil.text(avatarText.toUpperCase()),
            style: const TextStyle(color: AppColors.primaryTextDark),
          ),
        ),
      ),
    );
  }
}

class AvatarUtil {
  static String text(String? text) {
    if (text == null) return '-';
    final cleanedText = text.replaceAll(_emojiRegex, '').trim();
    final returnText = cleanedText.isEmpty
        ? '-'
        : cleanedText
            .split(' ')
            .where((e) => e.trim().isNotEmpty)
            .map((name) => name.isNotEmpty ? name[0].toUpperCase() : '')
            .take(2)
            .join();
    return returnText.isEmpty ? '-' : returnText;
  }

  static final _emojiRegex = RegExp(
    r'[\u{1f300}-\u{1f5ff}\u{1f900}-\u{1f9ff}\u{1f600}-\u{1f64f}'
    r'\u{1f680}-\u{1f6ff}\u{2600}-\u{26ff}\u{2700}'
    r'-\u{27bf}\u{1f1e6}-\u{1f1ff}\u{1f191}-\u{1f251}'
    r'\u{1f004}\u{1f0cf}\u{1f170}-\u{1f171}\u{1f17e}'
    r'-\u{1f17f}\u{1f18e}\u{3030}\u{2b50}\u{2b55}'
    r'\u{2934}-\u{2935}\u{2b05}-\u{2b07}\u{2b1b}'
    r'-\u{2b1c}\u{3297}\u{3299}\u{303d}\u{00a9}'
    r'\u{00ae}\u{2122}\u{23f3}\u{24c2}\u{23e9}'
    r'-\u{23ef}\u{25b6}\u{23f8}-\u{23fa}\u{200d}]+',
    unicode: true,
  );
}

extension StringX on String {
  bool get isNumber => RegExp(r'^\d{10}$').hasMatch(this);
  bool get isPanNumber => RegExp(r'^[a-zA-Z0-9]{10}$').hasMatch(this);
  bool get isNumeric => RegExp(r'^-?\d+$').hasMatch(this);
  bool get isNMC => RegExp(r'^[A-Z0-9]{6,12}$').hasMatch(this);
  bool get isReferCode => RegExp(r'^[0-5]{5}$').hasMatch(this);
  bool get isName => RegExp(r'\b[a-zA-Z]{3,}\b').hasMatch(this);
  bool get isParagraph => RegExp(r'\b[a-zA-Z]{10,}\b').hasMatch(this);
  bool get isEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',)
      .hasMatch(this);

  String truncateWithEllipsis({int maxWords = 100}) {
    final words = split(' ');
    if (words.length <= maxWords) {
      return this;
    }
    return '${words.take(maxWords).join(' ')}...';
  }
}

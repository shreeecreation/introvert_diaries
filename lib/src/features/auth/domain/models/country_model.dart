class CountryModel {
  final String code;
  final String name;
  final String dialCode;
  final String? emoji;

  CountryModel({
    required this.code,
    required this.name,
    required this.dialCode,
    this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'] as String,
      name: json['name'] as String,
      dialCode: json['dial_code'] as String,
      emoji: json['emoji'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'dial_code': dialCode,
      'emoji': emoji,
    };
  }
}

enum Gender {
  male('Male', 'male'),
  female('Female', 'female'),
  other('Others', 'others'),
  ;

  const Gender(this.name, this.value);

  final String name;
  final String value;

  static Gender? fromValue(String? value) {
    return switch (value) {
      'male' => Gender.male,
      'female' => Gender.female,
      'others' => Gender.other,
      String() => null,
      null => null,
    };
  }
}

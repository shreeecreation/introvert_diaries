enum Housing {
  onCampus('On Campus', 'on_campus'),
  offCampus('Off Campus', 'off_campus'),
  ;

  const Housing(this.name, this.value);

  final String name;
  final String value;

  static Housing? fromValue(String? value) {
    return switch (value) {
      'on_campus' => Housing.onCampus,
      'off_campus' => Housing.offCampus,
      String() => null,
      null => null,
    };
  }
}

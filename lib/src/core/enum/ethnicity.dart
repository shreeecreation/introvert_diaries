enum Ethnicity {
  asian('Asian', 'asian'),
  africanAmerican('African American', 'african_american'),
  hispanicLatino('Hispanic/Latino', 'hispanic_latino'),
  caucasianWhite('Caucasian/White', 'caucasian_white'),
  nativeAmerican('Native American', 'native_american'),
  alaskaNative('Alaska Native', 'alaska_native'),
  pacificIslander('Pacific Islander', 'pacific_islander'),
  middleEasternNorthAfrican('Middle Eastern/North African', 'middle_eastern_north_african'),
  nativeHawaiian('Native Hawaiian', 'native_hawaiian'),
  multiracialMixed('Multiracial/Mixed', 'multiracial_mixed'),
  ;

  const Ethnicity(this.name, this.value);

  final String name;
  final String value;

  static Ethnicity? fromValue(String? value) {
    return switch (value) {
      'asian' => Ethnicity.asian,
      'african_american' => Ethnicity.africanAmerican,
      'hispanic_latino' => Ethnicity.hispanicLatino,
      'caucasian_white' => Ethnicity.caucasianWhite,
      'native_american' => Ethnicity.nativeAmerican,
      'alaska_native' => Ethnicity.alaskaNative,
      'pacific_islander' => Ethnicity.pacificIslander,
      'middle_eastern_north_african' => Ethnicity.middleEasternNorthAfrican,
      'native_hawaiian' => Ethnicity.nativeHawaiian,
      'multiracial_mixed' => Ethnicity.multiracialMixed,
      String() => null,
      null => null,
    };
  }
}

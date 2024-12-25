enum Classification {
  freshmen('Freshmen', 'freshmen'),
  sophomore('Sophomore', 'sophomore'),
  junior('Junior', 'junior'),
  senior('Senior', 'senior'),
  gradStudent('Grad Student', 'grad_student'),
  ;

  const Classification(this.name, this.value);

  final String name;
  final String value;

  static Classification? fromValue(String? value) {
    return switch (value) {
      'freshmen' => Classification.freshmen,
      'sophomore' => Classification.sophomore,
      'junior' => Classification.junior,
      'senior' => Classification.senior,
      'grad_student' => Classification.gradStudent,
      String() => null,
      null => null,
    };
  }
}

import 'package:introvertdiaries/src/core/form/field.dart';

mixin FormMixin {
  bool get isValid => fields.every((field) => field.isValid);

  List<Field<dynamic>> get fields;
  Map<String, dynamic> get values;
}

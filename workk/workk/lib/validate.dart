// validate.dart
String? validateTemperature(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a temperature';
  }
  final double? temperature = double.tryParse(value);
  if (temperature == null) {
    return 'Please enter a valid number';
  }
  return null;
}

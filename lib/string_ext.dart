//https://dart.dev/guides/language/extension-methods
extension StringExtensions on String {
  int toIntOrZero() => int.tryParse(trim()) ?? 0;
  int? toIntOrNull() => int.tryParse(trim());

  double toDoubleOrZero() => double.tryParse(trim()) ?? 0.0;
  double? toDoubleOrNull() => double.tryParse(trim());

  int parseInt() {
    //this diguanakan utk menaruh valuenya
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

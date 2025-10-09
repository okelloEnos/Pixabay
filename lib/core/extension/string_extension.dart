extension StringExtensions on String {
  String get capitalizeFirstName {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
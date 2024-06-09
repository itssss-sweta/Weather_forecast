extension GetUvIndex on num {
  String get getUvIndex {
    if (this >= 0 && this <= 2) {
      return 'Low';
    } else if (this >= 3 && this <= 5) {
      return 'Moderate';
    } else if (this >= 6 && this <= 7) {
      return 'High';
    } else if (this >= 8 && this <= 10) {
      return 'Very High';
    } else {
      return 'Extreme';
    }
  }
}



String calculateExperience(DateTime joiningDate) {
  final today = DateTime.now();

  // Difference in months
  int years = today.year - joiningDate.year;
  int months = today.month - joiningDate.month;
  int days = today.day - joiningDate.day;

  // Adjust if negative
  if (days < 0) {
    months -= 1;
    days += DateTime(today.year, today.month, 0).day;
  }
  if (months < 0) {
    years -= 1;
    months += 12;
  }

  // Convert months into fractional years (e.g., 1.2 years)
  double totalYears = years + (months / 12);
  String formattedYears = totalYears.toStringAsFixed(1);

  if (totalYears < 1) {
    // Less than a year → show in months
    return "$months months";
  } else if (totalYears == totalYears.roundToDouble()) {
    // Whole number (e.g., 1.0 → 1 year)
    return "${totalYears.toInt()} year${totalYears.toInt() > 1 ? 's' : ''}";
  } else {
    // Decimal year (e.g., 1.2 years)
    return "$formattedYears YEARS";
  }
}
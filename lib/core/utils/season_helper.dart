String suggestSeason(DateTime date) {
  final month = date.month;
  final year = date.year;
  if (month == 11 || month == 12) return 'Đông Xuân ${year + 1}';
  if (month >= 1 && month <= 4) return 'Đông Xuân $year';
  if (month >= 5 && month <= 8) return 'Hè Thu $year';
  return 'Thu Đông $year';
}

List<String> getSeasonOptions(DateTime date) {
  final dxYear = (date.month == 11 || date.month == 12) ? date.year + 1 : date.year;
  return [
    'Đông Xuân $dxYear',
    'Hè Thu ${date.year}',
    'Thu Đông ${date.year}',
  ];
}

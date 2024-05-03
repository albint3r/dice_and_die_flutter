extension FinantialFormat on String {
  String mathFunc(Match match) => '${match[1]},';

  String formatToFinancial({
    bool isMoneySymbol = false,
  }) {
    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    final formatNumber = replaceAllMapped(reg, mathFunc);
    if (isMoneySymbol) {
      return '\$ $formatNumber';
    }
    return formatNumber;
  }
}

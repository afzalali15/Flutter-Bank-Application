class AccountFormatter {
  static String format(String accountNumber) {
    if (accountNumber == null || accountNumber.isEmpty) return "";
    return maskString(accountNumber, 4, 12, '*')
        .replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)}  ")
        .trim();
  }

  static String maskString(
      String strText, int start, int end, String maskChar) {
    if (strText == null || strText.isEmpty) return '';
    if (start < 0) start = 0;
    if (end > strText.length) end = strText.length;

    int maskLength = end - start;
    if (maskLength == 0) return strText;

    String sbMaskString = '';
    for (int i = 0; i < maskLength; i++) sbMaskString += maskChar;

    return strText.substring(0, start) +
        sbMaskString.toString() +
        strText.substring(start + maskLength);
  }
}

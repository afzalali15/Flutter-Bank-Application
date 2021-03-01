import 'package:bank_app/enums/account_type_enum.dart';

class AccountConverter {
  static String convert(AccountType cardType) {
    switch (cardType) {
      case AccountType.Current:
        return "Current Account";
        break;
      case AccountType.Saving:
        return "Saving Account";
        break;
      default:
        return "NA";
    }
  }
}

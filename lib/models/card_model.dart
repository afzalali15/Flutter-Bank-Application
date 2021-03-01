import 'package:bank_app/enums/account_type_enum.dart';
import 'package:bank_app/enums/cardtype_enum.dart';

class CardModel {
  final CardType cardType;
  final AccountType accountType;
  final String accountNumber;
  final double balance;
  final DateTime validThrough;

  CardModel(
    this.cardType,
    this.accountType,
    this.accountNumber,
    this.balance,
    this.validThrough,
  );
}

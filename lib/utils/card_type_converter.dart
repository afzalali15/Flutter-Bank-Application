import 'package:bank_app/enums/cardtype_enum.dart';

class CardTypeConverter {
  static String convert(CardType cardType) {
    switch (cardType) {
      case CardType.Master:
        return "assets/images/master.png";
        break;
      case CardType.Visa:
        return "assets/images/visa.png";
        break;
      default:
        return "assets/images/placeholder.png";
    }
  }
}

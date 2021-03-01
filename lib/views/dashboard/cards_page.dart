import 'dart:math';

import 'package:bank_app/enums/account_type_enum.dart';
import 'package:bank_app/enums/cardtype_enum.dart';
import 'package:bank_app/models/card_model.dart';
import 'package:bank_app/themes/custom_colors.dart';
import 'package:bank_app/utils/account_converter.dart';
import 'package:bank_app/utils/account_formatter.dart';
import 'package:bank_app/utils/card_type_converter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardsPage extends StatelessWidget {
  final cards = [
    CardModel(CardType.Master, AccountType.Current, '1234567890123456',
        130000000, DateTime(2023, 6)),
    CardModel(CardType.Visa, AccountType.Saving, '1234567890123456', 11000000,
        DateTime(2025, 2)),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ListView.builder(
        itemCount: cards.length,
        padding: const EdgeInsets.fromLTRB(
            12, 12, 12, 64), //extra padding to show widgets below FAB
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.center,
            child: Container(
              width: min(400, constraints.maxWidth),
              child: AspectRatio(
                aspectRatio: 1.6,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: cardColors[index % cardColors.length],
                  ),
                  child: Stack(
                    children: [
                      //Icon
                      Positioned(
                        left: -80,
                        child: Icon(
                          Icons.supervisor_account_sharp,
                          size: 256,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      //Card Content
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Card Type Logo
                                Image.asset(CardTypeConverter.convert(
                                    cards[index].cardType)),
                                //Account Info
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      AccountConverter.convert(
                                          cards[index].accountType),
                                      style: GoogleFonts.cairo(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      AccountFormatter.format(
                                          cards[index].accountNumber),
                                      style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .fontSize,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Balance
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Balance',
                                      style: GoogleFonts.cairo(
                                          color: Colors.white),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.cairo(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 24),
                                        children: <TextSpan>[
                                          TextSpan(text: '130,000,00'),
                                          TextSpan(
                                            text: ' IQD',
                                            style:
                                                GoogleFonts.cairo(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //Validity
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Valid Through',
                                      style: GoogleFonts.cairo(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      DateFormat('MM/yy')
                                          .format(cards[index].validThrough),
                                      style: GoogleFonts.cairo(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}

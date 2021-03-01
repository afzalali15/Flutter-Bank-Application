import 'package:bank_app/models/quick_action.dart';
import 'package:bank_app/themes/custom_colors.dart';
import 'package:bank_app/utils/account_formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsPage extends StatelessWidget {
  final quickActions = [
    QuickAction('assets/images/wallet.png', 'Cash Transfer'),
    QuickAction('assets/images/account.png', 'Other accounts in same branch'),
    QuickAction('assets/images/self.png', 'Between Own Accounts'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
          12, 12, 12, 64), //extra padding to show widgets below FAB
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Quick View of Account
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 8,
                  color: Colors.grey[100],
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Account Number and Address
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AccountFormatter.format('1234567890123456'),
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text('Al Nahda Branch - Dubai, UAE'),
                        ],
                      ),
                    ),
                    //Validity
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Card Valid Through'),
                        Text(
                          '06/23',
                          style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.cairo(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                        children: <TextSpan>[
                          TextSpan(text: '130,000,00'),
                          TextSpan(
                            text: ' IQD',
                            style: GoogleFonts.cairo(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Saving Account',
                      style: GoogleFonts.cairo(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 32),
          //Transfer Title
          Row(
            children: [
              Icon(Icons.remove, color: primaryColor, size: 36),
              SizedBox(width: 8),
              Text(
                'Transfer Amount',
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ],
          ),
          //Quick Action items
          Column(
            children: List.generate(
              quickActions.length,
              (index) => buildQuickAction(index),
            ),
          ),
        ],
      ),
    );
  }

  Container buildQuickAction(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Colors.grey[100],
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(quickActions[index].iconName),
        title: Text(
          quickActions[index].title ?? '',
          style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: Colors.black,
        ),
        onTap: () {},
      ),
    );
  }
}

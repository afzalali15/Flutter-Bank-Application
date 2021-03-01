import 'package:bank_app/themes/custom_colors.dart';
import 'package:bank_app/views/dashboard/accounts_page.dart';
import 'package:bank_app/views/dashboard/cards_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Accounts'),
          leading: IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
          bottom: TabBar(
            indicatorWeight: 3,
            indicatorColor: primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: primaryColor,
            unselectedLabelColor: Colors.black,
            labelStyle:
                GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w700),
            unselectedLabelStyle:
                GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.w700),
            tabs: [
              Tab(text: 'Accounts'),
              Tab(text: 'Cards'),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              AccountsPage(),
              CardsPage(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: primaryColor,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

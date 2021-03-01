import 'package:bank_app/views/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.cairoTextTheme(
          Theme.of(context).textTheme.copyWith(
                bodyText2: TextStyle(fontSize: 18),
              ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: false,
          color: Colors.white,
          textTheme: GoogleFonts.cairoTextTheme(
            Theme.of(context).textTheme.copyWith(
                  headline6: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

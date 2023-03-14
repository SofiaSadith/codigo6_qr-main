import 'package:codigo6_qr/pages/home_page.dart';
import 'package:codigo6_qr/ui/general/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kBrandSecondaryColor,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomePage(),
    );
  }
}

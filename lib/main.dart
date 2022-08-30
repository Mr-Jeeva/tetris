import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen.dart';

void main() {
  runApp(const AppTheme());
}

class AppTheme extends StatelessWidget {


  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tertis',
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: const Home()
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/screens/tab_screen.dart';

void main() {
 runApp (
  ProviderScope(child: 
  MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromRGBO(255, 46, 18, 0)),
      textTheme: GoogleFonts.latoTextTheme(),
      // scaffoldBackgroundColor: ColorScheme
    ),
    debugShowCheckedModeBanner: false,
    home:const  TabScreen(), 
  ),
  ),
  );
}

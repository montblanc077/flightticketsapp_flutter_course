import 'package:flutter/material.dart';
import 'package:flighttickets/screens/welcome_screen.dart';
import 'package:flighttickets/screens/home_screen.dart';
import 'package:flighttickets/screens/search.dart';
import 'package:flighttickets/screens/search_result.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flighttickets/constants/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('en', 'US'), // Current locale
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ru', 'RU'), // RU
      ],
      title: 'Flight Tickets List App',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          minWidth: 315.0,
          height: 67.0,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFF222533)),
              borderRadius: BorderRadius.circular(15.0)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintStyle: hintStyle,
          labelStyle: labelStyle,
        ),
        fontFamily: 'Helvetica',
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xFF222533),
        primaryColor: Color(0xFF222533),
      ),
      home: WelcomeScreen(),
//      initialRoute: HomeScreen.id,
//      routes: <String, WidgetBuilder>{
//        HomeScreen.id: (BuildContext context) => HomeScreen(),
//        FlightSearchScreen.id: (BuildContext context) => FlightSearchScreen(),
//        FlightListingScreen.id: (BuildContext context) => FlightListingScreen(),
//      },
    );
  }
}

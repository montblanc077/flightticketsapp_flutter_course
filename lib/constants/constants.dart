import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const hintStyle = TextStyle(
    color: Color(0xFF222533), fontSize: 18.0, fontWeight: FontWeight.bold);

const labelStyle = TextStyle(
    color: Color(0xFF929199), fontSize: 14.0, fontWeight: FontWeight.normal);

const MaterialColor mainColor = const MaterialColor(
  0xFF222533,
  const <int, Color>{
    50: const Color(0xFF222533),
    100: const Color(0xFF222533),
    200: const Color(0xFF222533),
    300: const Color(0xFF222533),
    400: const Color(0xFF222533),
    500: const Color(0xFF222533),
    600: const Color(0xFF222533),
    700: const Color(0xFF222533),
    800: const Color(0xFF222533),
    900: const Color(0xFF222533),
  },
);

final formatCurrency =
    NumberFormat.currency(locale: "en_US", symbol: "€", decimalDigits: 0);

const loginTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: labelStyle,
    border: UnderlineInputBorder(),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF222533), width: 1.0)),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF222533), width: 2.0),
    ));

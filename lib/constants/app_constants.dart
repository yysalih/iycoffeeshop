import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const String kAppName = "İycoffee";
const String appFont = "Poppins";
const String kBackgroundImage = "assets/images/login_background.jpg";


const Color kLightPrimary = Color(0xFF7B5E43); //
const Color kLightSecondary = Color(0xFFD2B48C);
const Color kLightBackground = Color(0xFFF5ECE1);
const Color kLightText = Color(0xFF3E2C20); //
const Color kLightAccent = Color(0xFFC69C6D);
const Color kLightAccent2 = Color(0xFFFAF3E0);

const Color kDarkPrimary = Color(0xFF3E2C20); // Rich dark brown
const Color kDarkSecondary = Color(0xFF8B6A4F); // Deep roasted tan
const Color kDarkBackground = Color(0xFF2A1E16); // Espresso black
const Color kDarkText = Color(0xFFD7C4B7); // Light mocha text
const Color kDarkAccent = Color(0xFF6D4C41); // Dark caramel
const Color kDarkAccent2 = Color(0xFF685454); // Dark caramel

Color textColor(bool theme) => theme ? kLightText : kDarkText;
Color reverseBackgroundColor(bool theme) => theme ? kDarkSecondary : kLightBackground;
Color buttonColor(bool theme) => theme ? kDarkAccent : kLightSecondary;
Color backGroundColor(bool theme) => theme ? Colors.white : kDarkAccent2;
Color cardColor(bool theme) => theme ? kLightAccent2 : kLightBlack;


// Example usage in a ThemeData:

ThemeData kLightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: kLightPrimary,
    secondary: kLightSecondary,
    background: kLightBackground,

  ),

  // ... other theme properties
);

ThemeData kDarkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: kDarkPrimary,
    secondary: kDarkSecondary,
    background: kDarkBackground,
  ),
  // ... other theme properties
);

const Color kGreen = Color(0xFF7BC74D);
const Color kBlack = Color(0xFF222831);
const Color kLightBlack = Color(0xFF393E46);
const Color kWhite = Color(0xff7eeeeee);
const Color kLightGreen = Color(0xFFC4DAD2);
const Color kHintColor= Color(0xFFC7C8CC);
const Color kBlueColor= Colors.blueAccent;


const TextStyle kTitleTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 17, fontFamily: appFont);
const TextStyle kCustomTextStyle = TextStyle(fontSize: 15, fontFamily: appFont, color: kWhite);

const InputDecoration kInputDecoration = InputDecoration(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
);

const InputDecoration kInputDecorationWithNoBorder = InputDecoration(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
);

bool isUserAnonymous() => FirebaseAuth.instance.currentUser!.isAnonymous;
String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

Uri appUrl = Uri.parse('https://salihbalkis.com/get.php');
//Uri appUrl = Uri.parse('http://coral-lemur-335530.hostingersite.com/get.php');

const String kApiKey = "";

const String kProjectId = "iycoffee";



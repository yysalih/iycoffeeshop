import 'package:cloud_firestore/cloud_firestore.dart';
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
Color grayTextColor(bool theme) => theme ? Colors.grey.shade400 : kDarkText;
Color grayTextColor2(bool theme) => theme ? Colors.grey.shade400 : kBrownDark;
Color reverseTextColor(bool theme) => !theme ? kLightText : Colors.white;
Color reverseBackgroundColor(bool theme) => theme ? kDarkSecondary : kLightBackground;
Color buttonColor(bool theme) => theme ? kDarkAccent : kLightSecondary;
Color backGroundColor(bool theme) => theme ? Colors.white : kDarkAccent2;
Color cardColor(bool theme) => theme ? kOrangeSubtle : kLightBlack;
Color cardColor2(bool theme) => theme ? kLightAccent2 : kLightBlack2;


// Primary Brand Colors
const Color kPrimaryOrange = Color(0xFFE85B24);
const Color kPrimaryOrange2 = Color(0xFFed7c50);
const Color kPrimaryBrown = Color(0xFF7D562C);

// Orange Variants (Action & Energy)
const Color kOrangeLight = Color(0xFFF18C67);
const Color kOrangeDark = Color(0xFFB54116);
const Color kOrangeSubtle = Color(0xFFFCEEE9);

// Brown Variants (Warmth & Typography)
const Color kBrownLight = Color(0xFFA67C52);
const Color kBrownDark = Color(0xFF4B341D);
const Color kBrownSoft = Color(0xFFDCC8B4);

// Background & Neutral Variants
const Color kBackgroundCream = Color(0xFFF9F3EE);
const Color kSurfaceWhite = Color(0xFFFFFFFF);
const Color kTextDark = Color(0xFF2D1F12);
const Color kTextGrey = Color(0xFF9E9E9E);
const Color kLightGrey = Color(0xFFd8d8d8);
const Color kLightGrey2 = Color(0xFFe0e0e0);





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
const Color kLightBlack2 = Color(0xFF332D2D);
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

InputDecoration kStrokedInputDecoration = InputDecoration(
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: kLightGrey2, width: 0.75)),
  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: kLightGrey2, width: 0.75)),
  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: kLightGrey2, width: 0.75)),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: kLightGrey2, width: 0.75)),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: kLightGrey2, width: 0.75)),
  focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: kLightGrey2, width: 0.75)),
);


InputDecoration kBorderInputDecoration = InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1)
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1)
  ),
  disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1)
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1)
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1)
  ),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 1)
  ),
);

bool isUserAnonymous() => FirebaseAuth.instance.currentUser == null ? false : FirebaseAuth.instance.currentUser!.isAnonymous;
String currentUserUid = FirebaseAuth.instance.currentUser == null ? "" :  FirebaseAuth.instance.currentUser!.uid;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

Uri appUrl = Uri.parse('https://salihbalkis.com/get.php');
//Uri appUrl = Uri.parse('http://coral-lemur-335530.hostingersite.com/get.php');

const String kApiKey = "";

const String kProjectId = "iycoffee";



import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';

abstract class CustomTheme {
  static get lightTheme {
    //1
    return ThemeData(
        fontFamily: 'Mukta',
        primaryColor: Colors.white,
// buttonTheme: const ButtonThemeData(
//       buttonColor: Colors.deepPurple,     //  <-- dark color
//       textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
//     ),
        /////////////////////////////////////
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.color3,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: MyColors.color4,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        ///////////////////////////////////

        inputDecorationTheme: InputDecorationTheme(
          // iconColor: const Color(0xff6268F1),

          hintStyle: const TextStyle(
            color: Color(0xff707070),
          ),
          focusColor: Colors.white,
          hoverColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: MyColors.color1,
                width: 1.5,
              )),
          fillColor: MyColors.color3,

          // hoverColor: Colors.white,
          filled: true,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: MyColors.color1,
                width: 1.5,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: MyColors.color1,
                width: 1.5,
              )),
        ),
        //////////////////////////////////////
        textTheme: TextTheme(
            headline6: TextStyle(color: Colors.grey[600]),
            headline3: const TextStyle(
              color: MyColors.color1,
              fontFamily: 'Almarai',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            headline1: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.color2,
                fontFamily: 'Almarai',
                fontSize: 25),
            headline4: const TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.color2,
                fontFamily: 'Almarai',
                fontSize: 14)));
  }
}

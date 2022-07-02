import 'package:express/main.dart';
import 'package:express/thems.dart';
import 'package:express/translation/translation.dart';
import 'package:express/view/auth/code_pin.dart';
import 'package:express/view/auth/forget.dart';
import 'package:express/view/auth/login.dart';
import 'package:express/view/auth/otp_forget.dart';
import 'package:express/view/auth/signup.dart';
import 'package:express/view/home/all_home/all_home.dart';
import 'package:express/view/home/all_home/productes/all_products.dart';
import 'package:express/view/home/all_home/productes/particular_producte.dart';
import 'package:express/view/home/all_home/productes/search_product.dart';
import 'package:express/view/home/all_home/productes/sub_sub_cat.dart';
import 'package:express/view/home/all_home/productes/sub_sub_subCat.dart';
import 'package:express/view/home/all_home/setting/aboutus.dart';
import 'package:express/view/home/all_home/setting/contactus.dart';
import 'package:express/view/home/all_home/setting/privecy.dart';
import 'package:express/view/home/all_home/setting/term.dart';
import 'package:express/view/home/home_page.dart';
import 'package:express/view/home/myCar/complete_cart.dart';
import 'package:express/view/home/myCar/deliver.dart';
import 'package:express/view/home/notification/notification.dart';
import 'package:express/view/start/lang.dart';
import 'package:express/view/start/welcom.dart';
import 'package:express/view/start/welcom_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //isLogin == true ? welcomHome() :
      home: isLogin == true ? welcomHome() : welcom(),
      theme: CustomTheme.lightTheme,
      routes: {
        "welcom": ((context) => welcom()),
        "welcomHome": ((context) => welcomHome()),
        "login": ((context) => login()),
        "signup": ((context) => signup()),
        "PinCodeVerificationScreen": ((context) => PinCodeVerificationScreen()),
        "homePage": ((context) => homePage()),
        "allHome": ((context) => allHome()),
        "notification": ((context) => notification()),
        // "myProductes": ((context) => myProductes()),
        "particularProducte": ((context) => particularProducte()),
        "completeCart": ((context) => completeCart()),
        "orderDeliver": ((context) => orderDeliver()),
        "allProducts": ((context) => allProducts()),
        "subSubCat": ((context) => subSubCat()),
        "sub3cat": ((context) => sub3cat()),
        "searchProduct": ((context) => searchProduct()),
        "term": ((context) => term()),
        "aboutus": ((context) => aboutus()),
        "contactus": ((context) => contactus()),
        "privecy": ((context) => privecy()),
        "forget": ((context) => forget()),
        "otpForget": ((context) => otpForget()),
        "langPage": ((context) => langPage()),
      },
      locale: Locale(lang),
      translations: Translation(),
      // locale: isStart == true ? Locale('ar') : Locale('ar'),
      // fallbackLocale: Locale('en'),
    );
  }

  monthly() {}
}

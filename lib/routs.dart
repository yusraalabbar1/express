import 'package:express/main.dart';
import 'package:express/thems.dart';
import 'package:express/translation/translation.dart';
import 'package:express/view/drier_vendor/drier_vendor/auth/driver/d_login.dart';
import 'package:express/view/drier_vendor/drier_vendor/auth/vendor/v_login.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/driver/chat_screen.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/driver/details.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/driver/home_pageD.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/driver/info.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/vendor/chat_vendor.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/vendor/details_order_vendor.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/vendor/order_vendor.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/welcom.dart';
import 'package:express/view/drier_vendor/drier_vendor/pages/welcom_homeVD.dart';
import 'package:express/view/user/auth/code_pin.dart';
import 'package:express/view/user/auth/forget.dart';
import 'package:express/view/user/auth/login.dart';
import 'package:express/view/user/auth/otp_forget.dart';
import 'package:express/view/user/auth/signup.dart';
import 'package:express/view/user/home/all_home/all_home.dart';
import 'package:express/view/user/home/all_home/productes/all_products.dart';
import 'package:express/view/user/home/all_home/productes/particular_producte.dart';
import 'package:express/view/user/home/all_home/productes/search_product.dart';
import 'package:express/view/user/home/all_home/productes/sub_sub_cat.dart';
import 'package:express/view/user/home/all_home/productes/sub_sub_subCat.dart';
import 'package:express/view/user/home/all_home/setting/aboutus.dart';
import 'package:express/view/user/home/all_home/setting/contactus.dart';
import 'package:express/view/user/home/all_home/setting/privecy.dart';
import 'package:express/view/user/home/all_home/setting/term.dart';
import 'package:express/view/user/home/home_page.dart';
import 'package:express/view/user/home/mprofile/edit_password.dart';
import 'package:express/view/user/home/myCar/complete_cart.dart';
import 'package:express/view/user/home/myCar/deliver.dart';
import 'package:express/view/user/home/myOrder/all_order.dart';
import 'package:express/view/user/home/notification/notification.dart';
import 'package:express/view/user/start/lang.dart';
import 'package:express/view/user/start/welcom.dart';
import 'package:express/view/user/start/welcom_home.dart';
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
      home: isLogin == 1
          ? welcomHome()
          : isLogin == 2
              ? welcomHomeVD()
              : isLogin == 3
                  ? welcomHomeVD()
                  : welcom(),
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
        "editPassword": ((context) => editPassword()),
        "allOrder": ((context) => allOrder()),
        "welcom2": ((context) => welcom2()),
        "loginVendor": ((context) => loginVendor()),
        "loginDriver": ((context) => loginDriver()),
        "welcomHomeVD": ((context) => welcomHomeVD()),
        "home_pageD": ((context) => home_pageD()),
        "details": ((context) => details()),
        "info": ((context) => info()),
        "ChatScreen": ((context) => ChatScreen()),
        "orderVendor": ((context) => orderVendor()),
        "chatVendor": ((context) => chatVendor()),
        "detailsOrderVendor": ((context) => detailsOrderVendor()),
      },
      locale: Locale(lang!),
      translations: Translation(),
      // locale: isStart == true ? Locale('ar') : Locale('ar'),
      // fallbackLocale: Locale('en'),
    );
  }

  monthly() {}
}

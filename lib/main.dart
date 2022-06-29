import 'package:express/control/controller.dart';
import 'package:express/model/api/general/banner.dart';
import 'package:express/model/api/products/all_product.dart';
import 'package:express/model/api/products/latest_products.dart';
import 'package:express/model/api/products/populer.dart';
import 'package:express/model/api/products/productDetails.dart';
import 'package:express/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isLogin;
var lang = "ar";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // lang = preferences.getString("lang")!;
  isLogin = preferences.getBool('islogin');
  print("==============================");

  print(isLogin);
  runApp(MyApp());
}

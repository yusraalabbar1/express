import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppLanguage extends GetxController {
  var appLocale;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    if (await GetStorage().read('lang') != null) {
      appLocale = GetStorage().read('lang');
    } else {
      appLocale = 'en';
    }

    update();
    Get.updateLocale(Locale(appLocale));
  }

  void changeLanguage(String type) async {
    var locale = Locale(type);
    Get.updateLocale(locale);
    update();
    GetStorage().write('lang', type);
  }
}

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/profile/editProfil.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey<FormState> formstate = new GlobalKey<FormState>();
homecontroller controller = Get.find();

controllerProduct controllerPro = Get.put(controllerProduct());
showLoadingLang(context) {
  var name, mobile, city, area;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
              key: formstate,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Change Language".tr,
                      style: TextStyle(
                          color: MyColors.color2,
                          fontSize: 13,
                          fontFamily: 'Almarai')),
                  SizedBox(
                    height: 30,
                  ),
                  // GetBuilder<homecontroller>(builder: (controller) {
                  //   return ();
                  // }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        color: MyColors.color2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color1, width: 2)),
                        child: Text("Arabic".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setString("lang", 'ar');
                          print('Button Clicked.');
                          controllerPro.SaveLanguage(
                              preferences.getString("lang"));
                          Get.updateLocale(Locale('ar'));
                          // langControl.changeLanguage('ar');
                          // Navigator.of(context).pushNamed("login");
                          Navigator.of(context)
                              .pushReplacementNamed("welcomHome");
                        },
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        color: MyColors.color2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: MyColors.color2, width: 2)),
                        child: Text("English".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setString("lang", 'en');

                          print('Button Clicked.');
                          controllerPro.SaveLanguage(
                              preferences.getString("lang"));
                          Get.updateLocale(Locale('en'));
                          // langControl.changeLanguage('ar');
                          // Navigator.of(context).pushNamed("login");
                          Navigator.of(context)
                              .pushReplacementNamed("welcomHome");
                        },
                      ),
                    ],
                  )
                ],
              )),
        );
      });
}

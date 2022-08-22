import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/model/api/auth/logout.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

showLoadingDelet(context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("sendMen") != "guest"
      ? showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Are you sure you want to Delete account?".tr,
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
                        child: Text("Yes".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.setInt("islogin", 0);
                          // Navigator.of(context).pushReplacementNamed("welcom");
                          SystemNavigator.pop();

                          var pass = preferences.getString("pass");
                          deletAccount(context, pass);
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
                        child: Text("No".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Almarai')),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          })
      : AwesomeDialog(
              context: context,
              animType: AnimType.RIGHSLIDE,
              dialogType: DialogType.ERROR,
              headerAnimationLoop: true,
              btnOkOnPress: () {},
              body: Text("لم تقم بتسجيل الدخول",
                  style: TextStyle(
                      color: MyColors.color2,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color3,
              btnOkColor: MyColors.color1)
          .show();
  ;
}

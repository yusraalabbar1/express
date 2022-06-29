import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/auth/veryfiyModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

veryfy(context, mobile, pass, otp) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST', Uri.parse(Base + '/verify-account?lang=$lang'));
  request.fields.addAll({'mobile': mobile, 'password': pass, 'otp_code': otp});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  VeryfiyModel c = VeryfiyModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.code == "200") {
      print(c.message);
      ///////////////////////////////////////////////
      preferences.setString("name", c.data!.user!.name.toString());
      controller.SaveProfileName(preferences.getString('name'));
      preferences.setString("mobile", c.data!.user!.mobile.toString());
      controller.SaveProfilemobile(preferences.getString('mobile'));
      preferences.setString(
          "photoProfile", c.data!.user!.photoProfile.toString());
      controller.SaveProfilephotoProfile(preferences.getString('photoProfile'));
      preferences.setString("city", c.data!.user!.city.toString());
      controller.SaveProfiledefaultAddress(preferences.getString('city'));
      preferences.setString("area", c.data!.user!.area.toString());
      controller.SaveProfiledefaultAddressarea(preferences.getString('area'));
      preferences.setString(
          "accessToken", c.data!.user!.accessToken.toString());
      controller.SaveProfileaccessToken(preferences.getString('accessToken'));
      preferences.setBool("islogin", true);
      ////////////////////////////////////////////////
      ////////////////////////////////////////////////
      ////////////////////////////////////////////////
      Navigator.of(context).pushReplacementNamed("welcomHome");
    } else {
      print(c.message);
      AwesomeDialog(
              context: context,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {},
              body: Text(c.message.toString(),
                  style: TextStyle(
                      color: MyColors.color2,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color3,
              btnOkColor: MyColors.color1)
          .show();
    }
  } else {
    print(c.message);
    AwesomeDialog(
            context: context,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            btnOkOnPress: () {},
            body: Text(c.message.toString(),
                style: TextStyle(
                    color: MyColors.color2,
                    fontSize: 14,
                    fontFamily: 'Almarai')),
            dialogBackgroundColor: MyColors.color3,
            btnOkColor: MyColors.color1)
        .show();
  }
}

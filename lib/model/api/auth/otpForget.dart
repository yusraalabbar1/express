import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/auth/forgetModel.dart';
import 'package:express/model/model_json/auth/registerModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

otpForgetMobil(context, otp) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST', Uri.parse(Base + '/restet-password?lang=$lang'));
  request.fields.addAll({
    'mobile': controller.saveNumberMobileForget,
    'otp_code': otp,
    'new_password': controller.savePassWordForget,
    'password_confirmation': controller.savePassWordForget
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  forgetModel c = forgetModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    if (c.status == true) {
      AwesomeDialog(
              context: context,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              btnOkOnPress: () {
                Navigator.of(context).pushNamed("login");
              },
              body: Text(c.message.toString() + "\n press ok \n",
                  style: TextStyle(
                      color: MyColors.color2,
                      fontSize: 14,
                      fontFamily: 'Almarai')),
              dialogBackgroundColor: MyColors.color3,
              btnOkColor: MyColors.color1)
          .show();
    } else {
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
    // print(response.reasonPhrase);
  }
}

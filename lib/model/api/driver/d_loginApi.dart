import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controllerDirver.dart';
import 'package:express/model/model_json/driver/d_loginModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:device_info/device_info.dart';

loginApi(context, mobile, pass) async {
  var identifier;
  final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      identifier = build.androidId; //UUID for Android

      print("*********androidId********");
      print(identifier);
      print("*********identifier********");
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      identifier = data.identifierForVendor; //UUID for iOS

      print("*********isIOS********");
      print(identifier);
      print("*********identifier********");
    }
  } on PlatformException {
    print('Failed to get platform version');
  }

  String? fcm_token = await FirebaseMessaging.instance.getToken();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  controllerDriver controller = Get.put(controllerDriver());
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/login?lang=ar'));
  request.fields.addAll({
    'mobile': mobile,
    'password': pass,
    'fcm_token': fcm_token.toString(),
    'device_type': identifier
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  LoginModel c = LoginModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.code == "200") {
      print(c.message);
      ///////////////////////////////////////////////
      preferences.setString(
          "accessTokenDriver", c.data!.user!.accessToken.toString());
      controller.SaveProfileaccessToken(
          preferences.getString('accessTokenDriver'));

      preferences.setInt("islogin", 2);
      controller.SaveDriverLogin(2);
      ////////////////////////////////////////////////
      Navigator.of(context).pushReplacementNamed("welcomHomeVD");
      ////////////////////////////////////////////////
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

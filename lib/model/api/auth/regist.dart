import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/auth/registerModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

registrition(
    context, name, mobile, city, area, password, passwordConfirmation) async {
  var headers = {'Accept': 'application/json'};
  var request =
      http.MultipartRequest('POST', Uri.parse(Base + '/register?lang=$lang'));
  request.fields.addAll({
    'name': name,
    'mobile': mobile,
    'city': city,
    'area': area,
    'password': password,
    'password_confirmation': passwordConfirmation
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  RegisterModel c = RegisterModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.code == "200") {
      print(c.message);
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
      Navigator.of(context).pushReplacementNamed("PinCodeVerificationScreen");
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

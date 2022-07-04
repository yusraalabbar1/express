import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/model/model_json/profile/profilModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

EditProfil(context, name, mobile, city, area) async {
  print(name);
  print(mobile);
  print(city);
  print(area);

  homecontroller controller = Get.find();

  print("enter");
  print(name);
  print(mobile);
  print(city);
  print(area);
  List<Map<dynamic, dynamic>> allProduct = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  // homecontroller controller = Get.put(homecontroller());
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse(Base + '/update-profile?lang=$lang'));
  request.fields
      .addAll({'name': name, 'mobile': mobile, 'city': city, 'area': area});

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  ProfilModel c = ProfilModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print(c.message);
      preferences.setString("name", c.data!.name.toString());
      controller.SaveProfileName(preferences.getString('name'));
      preferences.setString("mobile", c.data!.mobile.toString());
      controller.SaveProfilemobile(preferences.getString('mobile'));
      preferences.setString("city", c.data!.city.toString());
      controller.SaveProfiledefaultAddress(preferences.getString('city'));
      preferences.setString("area", c.data!.area.toString());
      controller.SaveProfiledefaultAddressarea(preferences.getString('area'));
    } else {
      print(c.message);
    }
    // print(await response.stream.bytesToString());
  } else {
    // print(response.reasonPhrase);
  }
}

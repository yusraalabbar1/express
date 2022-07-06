import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controllerDirver.dart';
import 'package:express/model/api/driver/d_orderApi.dart';
import 'package:express/model/model_json/driver/d_updateOrderModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

UpdateOrderApi(context, id, status, notes) async {
  controllerDriver controller = Get.put(controllerDriver());
  // List<Map<dynamic, dynamic>> allOrder = [];
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/update-order/$id?lang=ar'));

  if (status == "" && notes != "") {
    request.fields.addAll({'notes': notes});
  } else if (status != "" && notes == "") {
    request.fields.addAll({'status': status});
  } else if (status == "" && notes == "") {
    print("cant update");
  } else {
    request.fields.addAll({'status': status, 'notes': notes});
  }

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  UpdateOrderModel c = UpdateOrderModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    if (c.status == true) {
      print(c.message);
      print("===========1============");
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
      await OrderApi();
    } else {
      print("==========2=============");
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
    // print(response.reasonPhrase);
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

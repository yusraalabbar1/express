import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/cart/addCartModel.dart';
import 'package:express/utilits/colors.dart';
import 'package:express/utilits/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

AddCart(id, q, context, color, size) async {
  homecontroller controller = Get.put(homecontroller());
  SharedPreferences preferences = await SharedPreferences.getInstance();
  if (preferences.getString("sendMen") == "guest") {
    AwesomeDialog(
            context: context,
            animType: AnimType.RIGHSLIDE,
            dialogType: DialogType.INFO,
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
  } else {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(Base + '/cart?lang=$lang'));
    request.fields.addAll({
      'product_id': id.toString(),
      'quantity': q.toString(),
      'color': color,
      'size': size
    });
    print("============================");
    print(id);
    print(q);
    print(color);
    print(size);
    print("============================");
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    AddCartModel c = AddCartModel.fromJson(jsonDecode(res.body));

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      if (c.status == true) {
        print(c.message);
        AwesomeDialog(
                context: context,
                animType: AnimType.RIGHSLIDE,
                dialogType: DialogType.SUCCES,
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
      } else {
        print(c.message);
        AwesomeDialog(
                context: context,
                animType: AnimType.RIGHSLIDE,
                dialogType: DialogType.ERROR,
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
      print("errrrror");
    }
  }
}

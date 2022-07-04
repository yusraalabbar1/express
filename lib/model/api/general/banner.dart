import 'dart:convert';
import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/general/bannerModel.dart';
import 'package:express/utilits/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

banner() async {
  homecontroller controller = Get.put(homecontroller());
  List<String> bannerImage = [];
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('GET', Uri.parse(Base + '/banners?lang=$lang'));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  BannerModel c = BannerModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print("access banner");
      print(c.data!.length);
      for (var i = 0; i < c.data!.length; i++) {
        print(c.data![i].image);
        bannerImage.add(c.data![i].image.toString());
      }
      controller.SaveContrilerBannerImage(bannerImage);
      print(jsonDecode(res.body));
    } else {
      print("not access banner");
    }
  } else {
    print("error api banner");
  }
}

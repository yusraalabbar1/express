import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/categories/AllCatModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

SubCategories(sub) async {
  List<Map<dynamic, dynamic>> SubCat = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET', Uri.parse(Base + '/categories/$sub/sub/?lang=${controllerPro.i}'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AllCatModel c = AllCatModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SubCat.add(c.data![i].toJson());
      }

      print("=================SubCategories(sub)====================");
      print(SubCat);
      controllerPro.SaveSubCateg(SubCat);
    }
  } else {
    print("not response");
  }
  return res.body;
}

SubSubCategories(sub) async {
  List<Map<dynamic, dynamic>> SubCat = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/categories/$sub/sub/?lang=ar'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AllCatModel c = AllCatModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SubCat.add(c.data![i].toJson());
      }

      print("=================SubCategories(sub)====================");
      print(SubCat);
      controllerPro.SaveSubSubCateg(SubCat);
    }
  } else {
    print("not response");
  }
}

SubSubSubCategories(sub) async {
  List<Map<dynamic, dynamic>> SubCat = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/categories/$sub/sub/?lang=ar'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AllCatModel c = AllCatModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        SubCat.add(c.data![i].toJson());
      }

      print("=================SubCategories(sub)====================");
      print(SubCat);
      controllerPro.SaveSubSubSubCateg(SubCat);
    }
  } else {
    print("not response");
  }
}

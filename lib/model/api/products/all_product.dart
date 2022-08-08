import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

AllProduct(page) async {
  List<Map<dynamic, dynamic>> allProduct = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request =
      http.Request('GET', Uri.parse(Base + '/products/?lang=$lang&page=$page'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  print("========AllProductModel res body===============");
  print(res.body);
  AllProductModel c = AllProductModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allProduct.add(c.data![i].toJson());
      }
      print(allProduct);
      controllerPro.SaveAllProduct(allProduct);
    }
  } else {
    print("not response");
  }
  return jsonDecode(res.body);
}

MyAllProduct() async {
  List<Map<dynamic, dynamic>> allProduct = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  controllerPro.SaveAllProduct(allProduct);
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('GET',
      Uri.parse('https://myexpress.aqdeveloper.tech/api/v1/products/?lang=en'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  print("========AllProductModel res body===============");
  print(res.body);
  AllProductModel c = AllProductModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allProduct.add(c.data![i].toJson());
      }
      print(allProduct);
      controllerPro.SaveAllProduct(allProduct);
    }
  } else {
    print("not response");
  }
  return jsonDecode(res.body);
}

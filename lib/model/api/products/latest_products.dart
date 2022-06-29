import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/latestproductsModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

latestProduct() async {
  List<Map<dynamic, dynamic>> allProduct = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request =
      http.Request('GET', Uri.parse(Base + '/latest-products/?lang=$lang'));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  latestproductsModel c = latestproductsModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allProduct.add(c.data![i].toJson());
      }
      print(allProduct);
      controllerPro.SaveNewProduct(allProduct);
    }
  } else {}
}

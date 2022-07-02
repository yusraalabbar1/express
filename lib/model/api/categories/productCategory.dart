import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/api/products/productCartModel.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

CategoryProduct(id, page) async {
  List<Map<dynamic, dynamic>> allProduct = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('GET',
      Uri.parse(Base + '/categories/$id/products/?lang=$lang&page=$page'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  print("========ProductCategoryModel res categ===============");

  ProductCategoryModel c = ProductCategoryModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allProduct.add(c.data![i].toJson());
      }
      print(allProduct);
      controllerPro.SaveAllProductCategory(allProduct);
    }
  } else {
    print("not response");
  }

  return jsonDecode(res.body);
}

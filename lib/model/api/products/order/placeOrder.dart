import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/model_json/products/order/myOrderModel.dart';
import 'package:express/model/model_json/products/order/placeOrderModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

PlaceOrder(context, city) async {
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/place-order?lang=ar'));
  request.fields.addAll({'drop_address': city});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  placeOrderModel c = placeOrderModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print(c.message);
      Navigator.of(context).pushNamed("orderDeliver");
      await MyCart();
    } else {
      print(c.message);
    }
  } else {
    print("not response");
  }
}

import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/model/model_json/products/favorite/myFavModel.dart';
import 'package:express/model/model_json/products/order/detailOrderModel.dart';
import 'package:express/model/model_json/products/order/myOrderModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

orderDetail(id) async {
  homecontroller controller = Get.put(homecontroller());
  controllerProduct controllerPro = Get.put(controllerProduct());

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/order-details/${id}?lang=$lang'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  DetailsOrderModel c = DetailsOrderModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print("===============================");
      // print(c.data!.toJson());
      controllerPro.SaveDetailsOrder(c.data!.toJson());
    }
  } else {}
}

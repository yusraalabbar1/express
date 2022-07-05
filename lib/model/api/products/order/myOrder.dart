import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/order/myOrderModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

MyOrder(page) async {
  List<Map<dynamic, dynamic>> Myorder = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/my-orders?lang=$lang&page=$page'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  MyOrderModel c = MyOrderModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        Myorder.add(c.data![i].toJson());
      }
      print("========Myorder===============");
      print(Myorder);
      controllerPro.SaveMyOrder(Myorder);
    }
  } else {
    print("not response");
  }
}

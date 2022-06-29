import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/cart/updateCartModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

UpdatFromCart(id, q) async {
  homecontroller controller = Get.put(homecontroller());

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse(Base + '/update-cart?lang=$lang'));
  request.fields.addAll({'quantity': q, 'product_id': id});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  UpdatCartModel c = UpdatCartModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    if (c.status == true) {
      print(c.message);
    } else {
      print(c.message);
    }
  } else {
    // print(response.reasonPhrase);
    print("errrrror");
  }
}

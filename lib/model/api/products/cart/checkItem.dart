import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/api/products/cart/myCart.dart';
import 'package:express/model/model_json/products/cart/checkItem.dart';
import 'package:express/model/model_json/products/cart/updateCartModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

checkItem(id, ch) async {
  homecontroller controller = Get.put(homecontroller());

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request =
      http.MultipartRequest('POST', Uri.parse(Base + '/check-item?lang=$lang'));
  request.fields
      .addAll({'product_id': id.toString(), 'is_checked': ch.toString()});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  CheckItemModel c = CheckItemModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    await MyCart();
    // print(await response.stream.bytesToString());
    if (c.status == true) {
      print(c.message);
    } else {
      print(c.message);
    }
  } else {
    // print(response.reasonPhrase);
    print("errrrror");
    await MyCart();
  }
}

import 'dart:convert';
import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/cart/myCartModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

MyCart() async {
  List<Map<dynamic, dynamic>> MyCart = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('GET', Uri.parse(Base + '/cart?lang=$lang'));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  var res = await http.Response.fromStream(response);
  MyCartModel c = MyCartModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        MyCart.add(c.data![i].toJson());
      }
      print("========SaveMyMyCart===============");
      print(res.body);
      print(MyCart);
      controllerPro.SaveMyMyCart(MyCart);
      controllerPro.SavedeliveryFees(c.deliveryFees);
      controllerPro.SavecartTotal(c.cartTotal);
    }
  } else {
    print("not response");
  }

  return res.body;
}

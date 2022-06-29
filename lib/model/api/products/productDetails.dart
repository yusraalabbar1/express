import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/populerModel.dart';
import 'package:express/model/model_json/products/productDetailsModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';

detailsProducts(id) async {
  homecontroller controller = Get.put(homecontroller());
  controllerProduct controllerPro = Get.put(controllerProduct());

  Map<String, dynamic> details = {};
  // var ImageDetails;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request =
      http.Request('GET', Uri.parse(Base + '/products/$id/?lang=$lang'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  productDetailsModel c = productDetailsModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print("===============================");

      controllerPro.SaveDetailsProduct(c.data!.toJson());
      // controllerPro.SaveImageDetails(c.data!.images);
    }
  } else {}
}

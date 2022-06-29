import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/api/products/favorite/my_fav.dart';
import 'package:express/model/model_json/products/favorite/addFavModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

addFavorite(id) async {
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request =
      http.MultipartRequest('POST', Uri.parse(Base + '/favourites?lang=$lang'));
  request.fields.addAll({'product_id': id.toString()});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  print(res.body);
  AddFavModel c = AddFavModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print(c.message);
      // await MyFavorite();
    }
  } else {
    print(c.message);
  }
}

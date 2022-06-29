import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/model/model_json/products/favorite/myFavModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

MyFavorite() async {
  List<Map<dynamic, dynamic>> MyFavorite = [];
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('GET', Uri.parse(Base + '/favourites?lang=$lang'));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  MyFavoritModel c = MyFavoritModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        MyFavorite.add(c.data![i].toJson());
      }
      print("========favorit===============");
      print(MyFavorite);
      controllerPro.SaveMyFavprite(MyFavorite);
    }
  } else {
    print("not response");
  }
}

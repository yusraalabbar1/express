import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/categories/AllCatModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

AllCategories(lang) async {
  homecontroller controller = Get.put(homecontroller());

  controllerProduct controllerPro = Get.put(controllerProduct());
  List<Map<dynamic, dynamic>> allCat = [];
  List<Map<dynamic, dynamic>> all = [
    {
      "id": 0,
      "name": "all".tr,
      "image":
          "https://myexpress.aqdeveloper.tech/core/public/storage/categories/8/QAkzOJ8dcGQaxaHEPxMOAaqkvjdv4m14MjjCq3rL.jpg"
    }
  ];
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request =
      http.Request('GET', Uri.parse(Base + '/categories/?lang=$lang'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  AllCatModel c = AllCatModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      for (var i = 0; i < c.data!.length; i++) {
        allCat.add(c.data![i].toJson());
      }

      all.addAll(allCat);
      print("=================allCat====================");
      print(all);
      controllerPro.SaveAllCateg(all);
    }
  } else {
    print("not response");
  }
}

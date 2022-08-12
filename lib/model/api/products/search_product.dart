import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/categories/AllCatModel.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/model/model_json/products/searchModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Searchproduct(name, t) async {
  List<Map<dynamic, dynamic>> SearchCat = [];
  List<Pass> v = [];

  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  if (name == "" || name == " ") {
    var request = http.Request(
        'GET', Uri.parse(Base + '/search-products/?lang=$lang&filter=$t'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var res = await http.Response.fromStream(response);
    SearchModel c = SearchModel.fromJson(jsonDecode(res.body));
    // final result = SearchModelwelcomeFromJson(res.body);
    final result = passengersDataFromJson(res.body);
    v = result.data!;
    if (response.statusCode == 200) {
      if (c.status == true) {
        for (var i = 0; i < c.data!.length; i++) {
          SearchCat.add(c.data![i].toJson());
        }

        print("=================SearchCatCat====================");
        print(SearchCat);

        controllerPro.SaveSearchCateg(v);
      }
    } else {
      print("not response");
    }
  } else {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://myexpress.aqdeveloper.tech/api/v1/search-products/?lang=ar&name=$name&filter=$t'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var res = await http.Response.fromStream(response);
    SearchModel c = SearchModel.fromJson(jsonDecode(res.body));

    if (response.statusCode == 200) {
      if (c.status == true) {
        for (var i = 0; i < c.data!.length; i++) {
          SearchCat.add(c.data![i].toJson());
        }

        print("=================SearchCatCat====================");
        print(SearchCat);
        controllerPro.SaveSearchCateg(SearchCat);
      }
    } else {
      print("not response");
    }
  }
}

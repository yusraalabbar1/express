import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/control/controllerProduct.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/products/allProductModel.dart';
import 'package:express/model/model_json/setting/settingModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

getKeysFromMap(Map map) {
  List list = [];
  print('----------');
  print('Get keys:');
  // Get all keys
  map.keys.forEach((key) {
    print(key);
    list.add(key);
  });
  return list;
}

getValuesFromMap(Map map) {
  List list = [];
  // Get all values
  print('----------');
  print('Get values:');
  map.values.forEach((value) {
    list.add(value);
  });
  return list;
}

sitting() async {
  controllerProduct controllerPro = Get.put(controllerProduct());
  homecontroller controller = Get.put(homecontroller());

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('GET', Uri.parse(Base + '/settings?lang=$lang'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);

  SettingModel c = SettingModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print("========sitting res body===============");
      print(c.data!.toJson());
      controllerPro.SaveAllSetting(c.data!.toJson());
      controllerPro.SaveValueContact(
          getValuesFromMap(c.data!.contactUs!.toJson()));
      controllerPro.SaveKeyContact(getKeysFromMap(c.data!.contactUs!.toJson()));
    }
  } else {
    print("not response");
  }
  return jsonDecode(res.body);
}

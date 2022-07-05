import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/general/notificationModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

notificationApi(page) async {
  homecontroller controller = Get.put(homecontroller());
  List<Map<dynamic, dynamic>> NotificationMap = [];
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'GET', Uri.parse(Base + '/notifications?lang=$lang&page=$page'));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  notificationModel c = notificationModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {
      print("notification");
      print(c.data!.length);
      for (var i = 0; i < c.data!.length; i++) {
        NotificationMap.add(c.data![i].toJson());
      }
      controller.SaveNotificationMap(NotificationMap);
      print(jsonDecode(res.body));
    } else {
      print("not access notification");
    }
  } else {
    print("error api notification");
  }
}

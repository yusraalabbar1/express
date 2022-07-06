import 'dart:convert';

import 'package:express/control/controller.dart';
import 'package:express/view/user/auth/logoutModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

logout(context) async {
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request('POST',
      Uri.parse('https://myexpress.aqdeveloper.tech/api/v1/logout?lang=ar'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  logoutModel c = logoutModel.fromJson(jsonDecode(res.body));

  if (response.statusCode == 200) {
    if (c.status == true) {}
    // print(await response.stream.bytesToString());
  } else {
    // print(response.reasonPhrase);
  }
}

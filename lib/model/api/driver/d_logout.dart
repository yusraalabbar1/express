import 'package:express/control/controllerDirver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

driverLogout() async {
  controllerDriver controller = Get.put(controllerDriver());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://myexpress.aqdeveloper.tech/api/v1/delivery/logout?lang=ar'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

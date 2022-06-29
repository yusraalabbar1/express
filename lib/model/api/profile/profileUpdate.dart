import 'dart:convert';
import 'dart:io';

import 'package:express/control/controller.dart';
import 'package:express/main.dart';
import 'package:express/model/model_json/profile/profilModel.dart';
import 'package:express/utilits/url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

updateProfile(first, mobile, city, area, File image, fileName) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  homecontroller controller = Get.put(homecontroller());
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${controller.saveProfileaccessToken}'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse(Base + '/update-profile?lang=$lang'));
  request.fields
      .addAll({'name': first, 'mobile': mobile, 'city': city, 'area': area});
  request.files
      .add(await http.MultipartFile.fromPath('photo_profile', image.path));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  var res = await http.Response.fromStream(response);
  ProfilModel c = ProfilModel.fromJson(jsonDecode(res.body));
  if (response.statusCode == 200) {
    if (c.status == true) {
      print(c.message);
      // print(await response.stream.bytesToString());

      preferences.setString("photoProfile", c.data!.photoProfile.toString());
      controller.SaveProfilephotoProfile(preferences.getString('photoProfile'));
    } else {
      print(c.message);
    }
  } else {
    // print(response.reasonPhrase);
  }
}

// Upload(File imageFile, fileName) async {
//   homecontroller controller = Get.put(homecontroller());
//   var stream =
//       new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//   var length = await imageFile.length();
//   var headers = {
//     'Authorization': "Bearer ${tokenloginresult}",
//     "Content-Type": "multipart/form-data"
//   };
//   var uri = Uri.parse(baseUrlAdmin + '/api/UserImage/updateUserProfile');

//   var request = http.MultipartRequest("POST", uri);
//   var multipartFile = http.MultipartFile('file', stream, length,
//       filename: fileName, contentType: MediaType('image', 'jpg'));
//   //contentType: new MediaType('image', 'png'));
//   request.fields.addAll({'userId': idSaveprefpref.toString()});
//   request.files.add(multipartFile);
//   request.headers.addAll(headers);
//   var response = await request.send();
//   print(response.statusCode);
//   response.stream.transform(utf8.decoder).listen((value) async {
//     if (response.statusCode == 200) {
//       send_inf_loginupdate(usernamepref, passPref);
//       getpreflog();
//       // controller.SavePathImage(
//       //     "http://212.24.108.54/wsaAdmin/images/user/" + fileName);
//       //getpreflog();
//     }

//     print(value);
//   });
// }